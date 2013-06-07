module HopplerSupport
  def mysql
    @mysql = Mysql2::Client.new(:host => ENV['MYSQL_HOST'], :username => ENV['MYSQL_USERNAME'], :password => ENV['MYSQL_PASSWORD'])
  end
end

World(HopplerSupport)