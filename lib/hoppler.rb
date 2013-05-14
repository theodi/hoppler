require 'fog'
require 'active_support/all'
require 'dotenv'
require 'mysql2'
require 'tempfile'

Dotenv.load(".env", ".mysql.env")

class Hoppler

  def self.hostname
    `hostname`.strip
  end    
  
  def self.perform  
    client = Mysql2::Client.new(:host => "localhost", :username => ENV['MYSQL_USERNAME'], :password => ENV['MYSQL_PASSWORD'])    
    
    results = client.query("show databases")
    databases = results.map{|row| row['Database']}
    
    databases.each do |database|
      begin
        # Dump to tempfile
        tmpfile = Dir::Tmpname.make_tmpname Dir.tmpdir+File::Separator, nil
        dump_cmd = "mysqldump #{database} -u #{ENV['MYSQL_USERNAME']} --single-transaction"
        dump_cmd << " --password=#{ENV['MYSQL_PASSWORD']}" if ENV['MYSQL_PASSWORD']
        system "#{dump_cmd} | bzip2 > #{tmpfile}"
        # Write to rackspace
        dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
        filename = "#{hostname}/#{database}/#{DateTime.now.strftime("%F")}.sql.bz2"
        dir.files.create :key => filename, :body => File.open(tmpfile)
      ensure
        # Clean up tempfile
        FileUtils.rm tmpfile if tmpfile && File.exists?(tmpfile)
      end
    end
  end
  
  def self.cleanup  
    dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
    
    dir.files.each do |file|
      file.destroy if file.key.starts_with?(hostname) && 
                      file.last_modified < (DateTime.now - 1.month)
    end
  end
  
  def self.rackspace
    Fog::Storage.new({
        :provider            => 'Rackspace',
        :rackspace_username  => ENV['RACKSPACE_USERNAME'],
        :rackspace_api_key   => ENV['RACKSPACE_API_KEY'],
        :rackspace_auth_url  => Fog::Rackspace::UK_AUTH_ENDPOINT,
        :rackspace_region    => :lon
    })
  end
end
