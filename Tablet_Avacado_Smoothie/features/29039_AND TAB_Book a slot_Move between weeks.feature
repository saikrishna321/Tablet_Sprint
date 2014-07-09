@Manual

Feature: Navigate between different weeks slot

  Scenario: As a user, I want to verify different weeks slot in Book a slot screen

    Given I am on Book a slot page
    When I tap on Home Delivery
    Then I see three weeks slots on tapping relevant week

    When I tap on Click & Collect
    And I select Collection point
    Then I see three weeks slots on tapping relevant week.