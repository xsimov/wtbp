Feature: Sign up spec

  Background:
    Given I am in the sign up page
    
  Scenario: Successful
    When I fill in the sign up information
    Then I am registered

  Scenario: Unsuccsessful
    When I fill in wrong information
    Then I get a validation error message