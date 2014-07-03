@offer_list
Feature: As a user, navigate to offer list page

  @Offer_list_shop
  Scenario: As a user I navigate to offer list page from shop page

   #Given I go through the tour
   #When I sign in to the application
    Given I see the home page
    And I navigate to shop PLP
    Then I tap on Offer link
    And  Validate the Offer list screen

  @Offer_list_search
  Scenario: As a user i navigate to offer list page from search page

  # Given I go through the tour
  # When I sign in to the application
    Given I see the home page
    When I navigate to the search PLP
    Then I tap on Offer link
    And  Validate the Offer list screen

  @offer_list_specialoffers
  Scenario Outline: As a user i navigate to offer list page from Special offers

    #Given I go through the tour
    #When I sign in to the application
    Given I see the home page
    When I tap on "<SpecialOffer>" option from home page
    Then I tap on Offer link
    And  Validate the Offer list screen
    Then I navigate back to home screen

  Examples:
    | SpecialOffer |
    | Top offers   |
#    |Half price    |
#    |Buy 1 Get 1 Free |

