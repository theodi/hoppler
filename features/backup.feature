Feature: Backup all databases on the local server

  In order to be able to restore stuff
  As a devops person
  I need to have a working backup of all the MySQL databases on my box
  
  Scenario: Backup databases
    Given I have a database called "db_1"
    And I have a database called "db_2"
    When I run the backup command
    Then "db_1" should be backed up into Rackspace
    And "db_2" should be backed up into Rackspace