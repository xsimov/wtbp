Feature: Sessions to control who can edit and who can't

  Scenario: I can log in if I'm not
    Given I'm in any page
    When I access the log in menu
    And put my data
    Then I get redirected to my profile page
    And I can see the menu to edit

  Scenario: I can log out if I'm in
    Given I'm logged in
    And When I log out
    Then I see a notice
    And I don't see the menu anymore