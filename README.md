# Drupal Backup

A Ruby script and associated rake tasks to back up a Drupal database into Rackspace cloud files and clean up old (more than one month) backups.

## Usage

* `git pull` the repository into a sensible location on your server
* Run `bundle install`
* Create a `.env` file in the same format as `env.example` with your Rackspace username, API key, Container name and the full path to your Drupal install
* Run `rake drupal:backup`
* Erm
* That's it

You can then add the `rake drupal:backup` and `rake drupal:cleanup` tasks to your crontab like so:

    00 1 * * * cd /path/to/this/dir && rake rake drupal:backup
    00 2 * * 7 cd /path/to/this/dir && rake rake drupal:cleanup

**Note** You must have [Drush](http://drush.ws/) installed for this to work. If you haven't, you really should.

(It also goes without saying that you'll need Ruby and Bundler installed too)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
