@timecop
Feature: Clean up old backups
  
  In order for Rackspace to not charge us a bunch of money for having loads of old files hanging around
  As a devops person
  I want to make sure there are no backups over a month old in Rackspace
  
  Scenario:
    Given that it's 2013-03-01
    And I have a database backup called "foobar/db_1/2013-01-03.sql.gz" which was created on "2013-01-01"
    And I have a database backup called "foobar/db_1/2013-02-28.sql.gz" which was created on "2013-02-28"
    When I run the cleanup command
    Then I should not have a database backup called "foobar/db_1/2013-01-03.sql.gz"
    And I should have a database backup called "foobar/db_1/2013-02-28.sql.gz" 
    