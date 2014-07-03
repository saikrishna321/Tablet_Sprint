@AddNewAddress

Feature: Add new address from modal for Home delivery methods

  @AddNewAddress_HomeDelivery
  Scenario: To verify user is able to add a new address from modal for Home Delivery

    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a Slot" from the left hand navigation
    Then I am on the book a slot page
    When I tap change address option
    Then I tap add new address option
    When I check for invalid postcode popup
    And I enter valid postcode
    Then I add new address


  @AddAddress_Back_Navigation
  Scenario: To verify back navigation of the modal

    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a Slot" from the left hand navigation
    Then I am on the book a slot page
    When I tap change address option
    Then I tap add new address option
    And I enter valid postcode
    Then I verify the back navigation





