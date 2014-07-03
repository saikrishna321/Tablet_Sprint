@Change_Address  @sprint_02

Feature: Change address from modal
  Scenario: To verify change address from modal for Home Delivery

    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a Slot" from the left hand navigation
    Then I am on the book a slot page
    Then I change the address
