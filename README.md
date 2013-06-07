# Hoppler

A Ruby script and associated rake tasks to back up all local databases into Rackspace cloud files and clean up old (more than one month) backups.

## Usage

* Create a Rackspace files container (if it doesn't already exist)
* `git pull` the repository into a sensible location on your server
* Run `bundle install`
* Create a `.env` file in the same format as `env.example` with your Rackspace username, API key, and container name.
* Create a `.mysql.env` file in the same format as `mysql.env.example` with your mysql administrator username and password.
* Run `rake hoppler:backup`
* Erm
* That's it

You can then add the `rake hoppler:backup` and `rake hoppler:cleanup` tasks to your crontab like so:

    00 1 * * * cd /path/to/this/dir && rake hoppler:backup
    00 2 * * 7 cd /path/to/this/dir && rake hoppler:cleanup

(It goes without saying that you'll need Ruby and Bundler installed too)

To restore a database, you'll need some DB credentials in a YAML file (by default at `db.creds.yaml`). Then just run `rake hoppler:cleanup` and the lastest backup will be pulled down and restored.

## Running tests

To run tests, just run `bundle exec rake`. This will install some Chef cookbooks, bring up a Vagrant node and then run tests using the Vagrant node as a database server. This is important because we want a consistent, easily destructable environment to test against.

There is an exmaple `.env.test` file to run the tests against. Just add your Rackspace credentials, rename it to `.env.test` and it should just work.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
