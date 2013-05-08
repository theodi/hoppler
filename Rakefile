require './lib/drupal-backup.rb'

namespace :drupal do
  task :backup do
    DrupalBackup.perform
  end
  
  task :cleanup do
    DrupalBackup.cleanup
  end
end