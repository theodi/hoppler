@timecop
Feature: Clean up old backups
  
  In order for Rackspace to not charge us a bunch of money for having loads of old files hanging around
  As a devops person
  I want to make sure there are no backups over a month old in Rackspace
  
  Scenario:
    Given it's 2013-01-03
    And I have a database called "db_1"
    And I run the backup command
    And "db_1" should be backed up into Rackspace
    And it's two months in the future
    When I run the cleanup command
    Then I should not have a database backup called "db_1/2013-01-03.sql.gz"