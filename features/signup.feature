Feature: Users basic ops

  Background: Sign up
    Given I am in the sign up page
    
  Scenario: Successfuly
    When I fill in the sign up information
    Then I am registered

  Scenario: Unsuccsessfuly
    When I fill in wrong information
    Then I get a validation error message