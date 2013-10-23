@mongo
Feature: backup mongo data into Rackspace

  As a responsible adult
  I want to backup my data into Rackspace

  Scenario: backup data
    Given I have a running mongo instance
    When I run the mongodump command
    Then the data should be stored in Rackspace