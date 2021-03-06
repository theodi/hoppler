require 'fog'
require 'active_support/all'
require 'dotenv'
require 'mysql2'
require 'tempfile'
require 'yaml'

Dotenv.load(".env.test", ".env", ".mysql.env", ".local.env")

class Cloudfile
  attr_reader :host, :db, :filename, :key

  def initialize f
    @cfile    = f
    @key      = f.key
    bits      = @key.split "/"
    @host     = bits[0]
    @db       = bits[1]
    @filename = bits[2]
  end

  def download
    tmpfile = Dir::Tmpname.make_tmpname Dir.tmpdir+File::Separator, nil
    File.open tmpfile, "w" do |derp|
      derp.write @cfile.body
    end

    tmpfile
  end
end

class Hoppler

  def self.hostname
    `hostname`.strip
  end

  def self.backup what=nil
    if not what
      self.mysql_backup
    else
      if what == "mongo"
        self.mongo_backup
      end
    end
  end

  def self.mongo_backup
    ENV['MONGO_HOST'] = "localhost" if ENV['MONGO_HOST'].nil?
    tmpdir  = Dir::Tmpname.make_tmpname Dir.tmpdir+File::Separator, nil
    tarfile = "mongo.%s.tar.bz2" % [
        DateTime.now.strftime("%FT%T")
    ]
    tarpath = "/tmp/%s" % [
        tarfile
    ]

    begin
      dump_cmd = "mongodump -h %s -o %s > /dev/null" % [
          ENV['MONGO_HOST'],
          tmpdir
      ]

      system dump_cmd

      tar_cmd = "tar cjf %s %s > /dev/null" % [
          tarpath,
          tmpdir
      ]

      system tar_cmd

      dir      = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
      filename = "%s/%s" % [
          hostname,
          tarfile
      ]

      dir.files.create :key => filename, :body => File.open(tarpath)
    ensure
      FileUtils.rmtree tmpdir if tmpdir && File.exists?(tmpdir)
      FileUtils.rm tarpath if tarpath && File.exists?(tarpath)
    end
  end

  def self.mysql_backup
    results   = self.connection.query("show databases")
    databases = results.map { |row| row['Database'] }

    ENV['MYSQL_HOST'] = "localhost" if ENV['MYSQL_HOST'].nil?

    databases.each do |database|
      begin
        # Dump to tempfile
        tmpfile  = Dir::Tmpname.make_tmpname Dir.tmpdir+File::Separator, nil
        dump_cmd = "mysqldump #{database} -u #{ENV['MYSQL_USERNAME']} --single-transaction"
        dump_cmd << " -h #{ENV['MYSQL_HOST']}"
        dump_cmd << " --password=#{ENV['MYSQL_PASSWORD']}" if ENV['MYSQL_PASSWORD']
        system "#{dump_cmd} | bzip2 > #{tmpfile}"
        # Write to rackspace
        dir      = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
        filename = "#{hostname}/#{database}/#{DateTime.now.strftime("%FT%T")}.sql.bz2"
        dir.files.create :key => filename, :body => File.open(tmpfile)
      ensure
        # Clean up tempfile
        FileUtils.rm tmpfile if tmpfile && File.exists?(tmpfile)
      end
    end
  end

  def self.restore
    dumps = {}
    dir   = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']
    dir.files.each do |f|
      c = Cloudfile.new f
      if c.host == self.hostname
        if dumps[c.db]
          if c.key > dumps[c.db].key
            dumps[c.db] = c
          end
        else
          dumps[c.db] = c
        end
      end
    end

    mysql = self.connection

    results      = mysql.query("show databases")
    existing_dbs = results.map { |row| row['Database'] }

    ENV['MYSQL_HOST'] = "localhost" if ENV['MYSQL_HOST'].nil?

    if ENV['DB_CREDS_FILE']
      creds = ENV['DB_CREDS_FILE']
    else
      creds = "db.creds.yaml"
    end

    y = YAML.load File.open creds

    dumps.each do |key, value|
      if not existing_dbs.include? key
        puts "Restoring #{key}"
        pw = y[key]
        # We have to run these queries seperately because mysql2 doesn't like multiple queries in one lump
        mysql.query("create database #{key}")
        mysql.query("grant all on #{key}.* to '#{key}'@'%' identified by '#{pw}';")
        mysql.query("flush privileges;")
        bzip = value.download
        dump = `bzcat #{bzip}`

        command = "mysql -u #{ENV['MYSQL_USERNAME']} "
        command << " -h #{ENV['MYSQL_HOST']}" if ENV['MYSQL_HOST'] != "localhost"
        command << " -p#{ENV['MYSQL_PASSWORD']}" if ENV['MYSQL_PASSWORD']
        command << " #{key}"
        system "bzcat #{bzip} | #{command}"

        File.unlink bzip
      end
    end
  end

  def self.cleanup
    dir = self.rackspace.directories.get ENV['RACKSPACE_DB_CONTAINER']

    dir.files.each do |file|
      file.destroy if file.key.starts_with?(hostname) &&
          file.last_modified < (DateTime.now - 1.month)
    end
  end

  def self.rackspace
    Fog::Storage.new({
                         :provider           => 'Rackspace',
                         :rackspace_username => ENV['RACKSPACE_USERNAME'],
                         :rackspace_api_key  => ENV['RACKSPACE_API_KEY'],
                         :rackspace_region   => ENV['RACKSPACE_REGION'].to_sym
                     })
  end

  def self.connection
    ENV['MYSQL_HOST'] = "localhost" if ENV['MYSQL_HOST'].nil?
    client = Mysql2::Client.new(:host => ENV['MYSQL_HOST'], :username => ENV['MYSQL_USERNAME'], :password => ENV['MYSQL_PASSWORD'])
  end
end
