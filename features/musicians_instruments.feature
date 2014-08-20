Feature: Musicians can have instruments associated

  Scenario: a musician wants to see an instrument list
    Given I am in a musician profile page
    Then I want to see a list

  Scenario: a musician with instruments wants to see them
    Given I am in a musician profile page with associated instruments
    Then I want to see the instruments in the list

  Scenario: a musician without instruments should see a warning
    Given I am in a musician profile that has no instruments
    Then I want to see a warning