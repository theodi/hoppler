require 'fog'
require 'active_support/all'
require 'dotenv'
require 'mysql2'

Dotenv.load

class Hoppler
  def self.perform
    client = Mysql2::Client.new(:host => "localhost")
    results = client.query("show databases")
    
    results.each do |result|
      unless result['Database'].match(/_schema|mysql/)    
        database = result['Database']
        filename = "#{database}-backup-#{DateTime.now.strftime("%F")}.sql.bz2"
        system "mysqldump #{database} | bzip2 > /tmp/#{filename}"

        dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
        dir.files.create :key => "#{database}/#{filename}", :body => File.open("/tmp/#{filename}")
      end
    end
  end
  
  def self.cleanup  
    dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
    
    dir.files.each do |file|
      file.destroy if file.last_modified < (DateTime.now - 1.month)
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
