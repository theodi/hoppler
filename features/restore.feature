Feature: Restore databases from backup

  In order to get a working node 
  As a devops person
  I need to be able to restore all my databases from backup
  
  Scenario: Restore all databases from backup
    Given I have a database called "db_1"
    And I have a database called "db_2"
    And I run the backup command
    And I delete all databases
    When I run the restore command
    Then I should have a database called "db_1"
    And I should have a database called "db_2"
    And "db_1" should contain the correct stuff
    And "db_2" should contain the correct stuff