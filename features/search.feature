Feature: In a database the search is a must

  Scenario: See the search field
    Given I go to the welcome page
    When I want to search something
    Then I get the results for all fields and kinds

  Scenario: I search within the bands page
    Given I go to the bands page
    When I search something
    Then I get the results for bands only

  Scenario: I search within the musicians page
    Given I go to the musicians page
    When I search something
    Then I get the results for musicians only
