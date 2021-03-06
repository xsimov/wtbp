Feature: Bands can be created as a group of musicians that has some own properties

  Scenario: Create a new band
    Given I'm logged in
    And I go to a musician's bands profile
    And I add a band
    Then I can enter the properties
    And I get redirected to that band's profile

  Scenario: When I create a band I want to be part of it by default
    Given I'm logged in
    And I go to a musician's bands profile
    When I add a band
    And I can enter the properties
    Then I want see that I am a member

# @javascript
#   Scenario: When I have a band I want to add members
#     Given I go to a band profile
#     When I want to add a new member
#     Then I can choose it from all the registered members
#     And add its position on the band
#     # And the musician I chose is in the list with its position in the band

  Scenario: A band member wants to add a concert
    Given I go to a new concert page
    Then I can enter the specifications
    And I get redirected to that concert page