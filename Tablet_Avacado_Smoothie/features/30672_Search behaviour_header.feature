@Manual-5 @Automation-3 @user_story-30672

Feature: Search mode and result header UI

  @Search_behaviour
  Scenario Outline: To verify the search mode and result header

    Given I see the home page
    And I navigates to "<page name>"
    When I navigate to the search PLP
    Then I verify the header of the search mode header
    And I verify the UI of the search result header
    And I verify that the search mode is an overlay

  Examples:

    | page name        |
    | Home             |
    | Shop             |
    | My favourites    |
    | My usuals        |
    | MY RECENT ORDERS |
    | Special offers   |
    | My orders        |


