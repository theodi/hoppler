require './lib/hoppler.rb'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  system("librarian-chef install && vagrant up")
  t.cucumber_opts = "features --format pretty"
end

namespace :hoppler do
  task :backup do
    Hoppler.backup
  end
  
  task :restore do
    Hoppler.restore
  end
  
  task :cleanup do
    Hoppler.cleanup
  end
end

task :default => [:features]