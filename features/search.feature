Feature: In a database the search is a must

  Scenario: See the search field
    Given I go to the welcome page
    When I want to search something
    Then I get the results for all fields and kinds