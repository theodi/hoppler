require 'fog'
require 'active_support/all'
require 'dotenv'

Dotenv.load

class Hoppler
  def self.perform  
    system "mysqldump #{ENV['MYSQL_DATABASE']} > /tmp/backup-#{DateTime.now.strftime("%F")}.sql"
    
    dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
    dir.files.create :key => filename, :body => File.open("/tmp/#{filename}")
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
