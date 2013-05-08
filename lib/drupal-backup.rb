require 'fog'
require 'active_support/all'
require 'dotenv'

Dotenv.load

class DrupalBackup
  def self.perform
    filename = "drupal-backup-#{DateTime.now.strftime("%F")}.sql"
    
    system "cd #{ENV['DRUPAL_ROOT']} && drush sql-dump > /tmp/#{filename}"
    
    service = self.rackspace
    
    dir = service.directories.get ENV['RACKSPACE_DB_CONTAINER']
    dir.files.create :key => filename, :body => File.open("/tmp/#{filename}")
  end
  
  def self.cleanup
    service = self.rackspace
    
    dir = service.directories.get ENV['RACKSPACE_DB_CONTAINER']
    
    dir.files.each do |file|
      if file.last_modified < (DateTime.now - 1.month)
        file.destroy
      end
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
