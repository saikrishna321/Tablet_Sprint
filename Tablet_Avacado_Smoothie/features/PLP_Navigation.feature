@All_PLP

Feature: As a user , i want to access PLPs

  Scenario Outline: Navigate to PLPs

    Given I see the home page
    And I navigates to "<page name>"
    When I tap on filters by
    Then I see "filtered" pop up
    When I tap on sort by
    Then I see "sorted" pop up


  Examples:
    |page name        |
    |Shop             |
    |Search           |
#    |My favourites    |
#    |My usuals        |
#    |MY RECENT ORDERS |
#    |Top offers       |
    |Half price       |
    |Buy1get1free     |
