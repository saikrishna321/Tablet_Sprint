@Manual_user_story-24494

Feature: Make PLP cards dynamic height

  @PLP_cards
  Scenario: To verify the PLP cards dynamic height

    Given I see the home page
    When I tap on shop all
    Then I verify the PLP screen UI as per the UI specs
    And  I verify the unit price is replaced by the weight switcher when that feature is available
    And I verify New Add/Remove component is displayed in all PLP screens