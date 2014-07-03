@wip
@pdp_validation

Feature: As a user, navigate to item PDP and validate the PDP

  @pdp_shop
  Scenario: As a user i navigate to PDP page from shop PLP
     # Given I go through the tour
     # When I sign in to the application
    Given I see the home page
    And I navigate to shop PLP
    Then I navigate to PDP
    And I validate PDP page

  @pdp_search
  Scenario: As a user i navigate to PDP page from search PLP
    # Given I go through the tour
    # When I sign in to the application
    Given I see the home page
    When I navigate to the search PLP
    Then I navigate to PDP
    And I validate PDP page

  @pdp_specialOffers
  Scenario Outline: As a user i navigate to PDP page from special offer PLP

    #Given I go through the tour
    #When I sign in to the application
    Given I see the home page
    When I tap on "<SpecialOffer>" option from home page
    Then I navigate to PDP
    And I validate PDP page
    Then I navigate back to home screen


  Examples:
    |SpecialOffer     |
    |Top offers       |
#    |Half price       |
#    |Buy 1 Get 1 Free |





