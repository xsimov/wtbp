Feature: Bands can be created as a group of musicians that has some own properties

  Scenario: Create a new band
    Given I go to a musician's bands profile
    When I add a band
    Then I can enter the properties