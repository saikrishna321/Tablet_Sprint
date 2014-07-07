Feature: As a user i want to verify if the PLP screen without Add/Remove buttons is displayed for pending orders

  @manual-4,@automation
  Scenario: As a user i want to verify first pending order is selected by default in My orders screen , verify position of Cancel Order & Make changes are in different position and validate Add and remove components are not displayed.

    Given I see the home page
    When I tap on "My orders" from LHN
    Then the first order must be in the selected state
    And I verify Cancel order and Make changes button are repositioned
    And tapping on Pending order from LHN should not display Add or remove component