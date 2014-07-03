@Manual_user_story-30672

Feature: Search mode and result header UI

  @Search_behaviour
  Scenario: To verify the search mode and result header

    Given I see the home page
    When I tap on search button
    Then I verify the UI of the search mode header
    And I verify the UI of the search result header
    And I verify that the search mode is an overlay