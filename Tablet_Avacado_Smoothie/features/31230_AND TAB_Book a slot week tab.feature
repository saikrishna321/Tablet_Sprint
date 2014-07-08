@manual-user_story-31230

Feature: Book a slot week tab

  @BS_Week_tab
  Scenario: To verify the week tab for book a slot

    Given I am on Book a slot page
    When I tap on Home Delivery
    Then I see week tab grid

    When I tap on Click & Collect
    And I select Collection point
    Then I see week tab grid