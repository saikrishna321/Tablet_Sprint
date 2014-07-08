@Automation
@ALL_PLP_Filters
Feature: Filter PLP

  @Shop_PLP/Basket
  Scenario: As a user, I navigation to Shop PLP and verifying filters

    Given I see the home page
    And I navigate to shop PLP
    Then I see filters

  @Search_PLP
  Scenario: As a user, I navigation to search PLP and verifying filters

    Given I see the home page
    When I tap the search bar
    Then I am on the search page
    And I see a scan button

    When I search for "sugar"
    Then I see some suggested searches

    When I select a suggested search item
    Then I see filters

  @My_Favourites_PLP

  Scenario: As a user, I navigation to My favourites PLP and verifying filters
    Given I see the home page
    When I open the left hand navigation (LHN)
    And I choose "Favourites" from the left hand navigation
    Then I am on the favourites hub

    When I select "My favourites" from the Favourites page
    Then I see filters

  @My_Usuals_PLP

  Scenario: As a user, I navigation to My usuals PLP and verifying filters
    Given I see the home page
    When I open the left hand navigation (LHN)
    And I choose "Favourites" from the left hand navigation
    Then I am on the favourites hub

    When I select "My usuals" from the Favourites page
    Then I see filters


  @My_Recent_Orders

  Scenario: As a user, I navigation to My recent orders PLP and verifying filters
    Given I see the home page
    When I open the left hand navigation (LHN)
    And I choose "Favourites" from the left hand navigation
    Then I am on the favourites hub

    When I select "My Recent Orders" from the Favourites page
    Then I see filters