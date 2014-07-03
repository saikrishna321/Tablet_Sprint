Feature: As a user , i want to access Special offers

@special_offers @sprint_02
  Scenario: Verify Special offers default view and switching between the special offer types

Given I see the home page
When I open the left hand navigation
And I choose "Special Offers" from the left hand navigation
Then I am on the "Special Offers" page
    #verify all special offers typed displayed in menu list

And I verified Top offers list displayed by default
And I switch to each Special offers type displayed in menu list