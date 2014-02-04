require './lib/hoppler.rb'

namespace :hoppler do 
  task :environment do
  end
  
  task :backup do
    Hoppler.backup
  end

  task :backup_mongo do
    Hoppler.backup "mongo"
  end
  
  task :restore, [:hostname] => :environment do |t, args|
    if args[:hostname].nil?
      Hoppler.restore
    else
      Hoppler.restore(args[:hostname])
    end
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
