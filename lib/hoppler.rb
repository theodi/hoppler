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

  class Cloudfile
    attr_reader :host, :db, :filename, :key
    def initialize f
      @cfile = f
      @key = f.key
      bits = @key.split "/"
      @host = bits[0]
      @db = bits[1]
      @filename = bits[2]
    end

    def download
      tmpfile = Dir::Tmpname.make_tmpname Dir.tmpdir+File::Separator, nil
      derp = File.open tmpfile, "w"
      derp.write @cfile.body

      tmpfile
    end
  end

  def self.restore
    dumps = {}
    dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
    dir.files.each do |f|
      c = Cloudfile.new f
      if c.host == self.hostname
        if dumps[c.db]
          if c.key > dumps[c.db].key
            dumps[c.db] = c
          end
        else
          dumps[c.db] = c
        end
      end
    end

    # Sorry. Really.
#    command = "mysqlshow -u #{ENV['MYSQL_USERNAME']} -p#{ENV['MYSQL_PASSWORD']} | grep -v '\\-\\-\\-' | grep -v Databases | tr -s ' ' ' ' | cut -d ' ' -f 2"
#    existing_dbs = `#{command}`.split

    client = Mysql2::Client.new(:host => "localhost", :username => ENV['MYSQL_USERNAME'], :password => ENV['MYSQL_PASSWORD'])    
    results = client.query("show databases")
    existing_dbs = results.map{|row| row['Database']}

    require 'yaml'
    y = YAML.load File.open "/root/db.creds.yaml"
    dumps.each do |key, value|
      if not existing_dbs.include? key
        puts "Restoring #{key}"
        pw = y[key]
        sql = "create database #{key}; grant all on #{key}.* to '#{key}'@'%' identified by '#{pw}'; flush privileges;"
        command = "mysql -u #{ENV['MYSQL_USERNAME']} -p#{ENV['MYSQL_PASSWORD']} -e \"%s\"" % [ sql ]
        `#{command}`
        bzip = value.download
        command = "bzcat #{bzip} | mysql -u #{ENV['MYSQL_USERNAME']} -p#{ENV['MYSQL_PASSWORD']} #{key}"
        `#{command}`
        File.unlink bzip
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
