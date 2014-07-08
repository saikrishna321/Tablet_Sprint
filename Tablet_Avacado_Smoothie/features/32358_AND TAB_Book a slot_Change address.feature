@Manual

Feature: Verify UI of  Change Address in Book a Slot page, verify change address button

  Scenario: As a user, I want to verify Change address button UI as per spec

    Given I am on Book a slot page
    When I tap on Home Delivery
    Then I see To address
    And I see Change Address button

    When I tap on Click & Collect
    And I select Collection point
    Then I see To address
    And I see Change Address button