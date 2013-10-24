Given(/^I have a running mongo instance$/) do
end

When(/^I run the mongodump command$/) do
  Hoppler.backup "mongo"
end

Then(/^the data should be stored in Rackspace$/) do
  dir = Hoppler.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']

  backups = []

  dir.files.each do |file|
    backups << file.key
  end

  file = "%s/mongo.%s" % [
      Hoppler.hostname,
      DateTime.now.strftime("%F")
  ]

  backups.to_s.should =~ /#{file}/
end