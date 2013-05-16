Given(/^I have a database called "(.*?)"$/) do |db|
  mysql.query("create database #{db}")
  command = "cat ./features/fixtures/#{db}.sql | "
  command << "mysql -u #{ENV['MYSQL_USERNAME']}"
  command << " -h #{ENV['MYSQL_HOST']}" if ENV['MYSQL_HOST'] != "localhost"
  command << " -p#{ENV['MYSQL_PASSWORD']}" if ENV['MYSQL_PASSWORD']
  command << " #{db}"
  system command
end

When(/^I run the backup command$/) do
  Hoppler.backup
end

Then(/^"(.*?)" should be backed up into Rackspace$/) do |db|
  dir = Hoppler.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
  
  backups = []
  
  dir.files.each do |file|
    backups << file.key
  end
  
  file = "#{Hoppler.hostname}/#{db}/#{DateTime.now.strftime("%F")}.sql.bz2"
  
  backups.should include(file)
end

Given(/^that it's (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a database backup called "(.*?)" which was created on "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I run the cleanup command$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not have a database backup called "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should have a database backup called "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I don't have a database called "(.*?)"$/) do |db|
  mysql.query("SHOW DATABASES LIKE 'db_1'").count.should == 0
end

Given(/^I delete all databases$/) do
  mysql.query("DROP DATABASE db_1")
  mysql.query("DROP DATABASE db_2")
  mysql.query("SHOW DATABASES LIKE 'db_1'").count.should == 0
  mysql.query("SHOW DATABASES LIKE 'db_2'").count.should == 0
end

Then(/^"(.*?)" should contain the correct stuff$/) do |db|
  original = `cat ./features/fixtures/#{db}.sql | grep -v "Dump completed on"`
  dump_cmd = "mysqldump #{db} -u #{ENV['MYSQL_USERNAME']} --single-transaction"
  dump_cmd << " -h #{ENV['MYSQL_HOST']} --set-gtid-purged=OFF" if ENV['MYSQL_HOST'] != "localhost"
  dump_cmd << " --password=#{ENV['MYSQL_PASSWORD']}" if ENV['MYSQL_PASSWORD']
  dump = `#{dump_cmd} | grep -v "Dump completed on"`
  binding.pry
  original.should == dump
end

When(/^I run the restore command$/) do
  Hoppler.restore
end

Then(/^I should have a database called "(.*?)"$/) do |db|
  mysql.query("SHOW DATABASES LIKE '#{db}'").count.should == 1
end