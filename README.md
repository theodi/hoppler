# Hoppler

A Ruby script and associated rake tasks to back up a database into Rackspace cloud files and clean up old (more than one month) backups.

## Usage

* Create a Rackspace files container (if it doesn't already exist)
* `git pull` the repository into a sensible location on your server
* Run `bundle install`
* Create a `.env` file in the same format as `env.example` with your Rackspace username, API key, Container name and your database name
* Create the file `~/.my.cnf` (permissions need to be 600)
* Add your database username and password to the newly created file in this format:

		[mysqldump]
		user=mysqlusername
		password=precioussecret

* Run `rake hoppler:backup`
* Erm
* That's it

You can then add the `rake hoppler:backup` and `rake hoppler:cleanup` tasks to your crontab like so:

    00 1 * * * cd /path/to/this/dir && rake hoppler:backup
    00 2 * * 7 cd /path/to/this/dir && rake hoppler:cleanup

(It goes without saying that you'll need Ruby and Bundler installed too)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
