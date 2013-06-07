After do
  if mysql.query("SHOW DATABASES LIKE 'db_1'").count == 1
   mysql.query("DROP DATABASE db_1")
  end
  
  if mysql.query("SHOW DATABASES LIKE 'db_2'").count == 1
    mysql.query("DROP DATABASE db_2")
  end
  
  dir = Hoppler.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']

  dir.files.each do |file|
    file.destroy
  end
end

After("@timecop") do
  Timecop.return
end