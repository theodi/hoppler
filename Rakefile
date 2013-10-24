require './lib/hoppler.rb'

namespace :hoppler do
  task :backup do
    Hoppler.backup
  end

  task :backup_mongo do
    Hoppler.backup "mongo"
  end
  
  task :restore do
    Hoppler.restore
  end
  
  task :cleanup do
    Hoppler.cleanup
  end
end

namespace :features do
  require 'cucumber'
  require 'cucumber/rake/task'
  
  task :cucumber do
    Cucumber::Rake::Task.new(:features) do |t|
      system("librarian-chef install && vagrant up")
      t.cucumber_opts = "features --format pretty"
      system("cucumber")
    end
  end
end

task :default => ["features:cucumber"]
