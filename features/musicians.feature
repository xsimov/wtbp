Feature: Musicians world

  Scenario: As a musician I want to sign up
    Given I go to the sign up page
    When I put my data
    Then I am resgistered successfully

  Scenario: I want to see a list of all registered musicians and their profile pages
    Given I go to the all musicians page
    And I can see all the registered musicians 
    And some bands they play on next to their name
    When I click on a musician's username
    Then I get redirected to its profile
    And I can see its information
@wip
  Scenario: As a registered musician I want to sign in
    Given I am a registered musician
    When I go to the sign in / up page
    And I input the login info
    Then I get redirected to my profile
    And I see the menu