@Automation

Feature: Filter PLP

  Scenario Outline : As a user, I want to verify different Filters in PLP page

    Given I see the home page
    And I navigate to shop PLP
    Then I see filters "<filter_name>"

  Examples:

    | filter_name    |
    | ALL            |
    | SPECIAL OFFERS |
    | NEW OFFERS     |
    | FAVOURITES     |