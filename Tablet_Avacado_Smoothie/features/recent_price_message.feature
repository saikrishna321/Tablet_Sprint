Feature: To verify Recent order Price Message


  @tfs_29043 @sprint_02 @recent_orders_price_message
  Scenario Outline: As a user i want to verify recent order Price Message in my recent orders from favorites

#    Given I go through the tour
#    When I sign in to the application
    Given I see the home page
    When I open the left hand navigation
    And I choose "<page name>" from the left hand navigation
    Then I tap on the "<sub title>"
    And I Validate the recent order Price Message
    Then I validate scroll off

  Examples:
    | page name           | sub title       |
    | Favourites & usuals | My Recent order |
    | My orders           | Previous order  |
