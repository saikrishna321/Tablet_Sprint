@Book_a_Slot_grid

Feature: Book a Slot

#  Scenario: Verify User can see full week of slots by tappin on HD option (Home Delivery)
#
#    Then I see the home page
#    When I open the left hand navigation
#    And I choose "Book a Slot" from the left hand navigation
#    Then I am on the book a slot page
#    When I select "Home Delivery" from the book a slot page
#    And I see full week slots displayed in a single screen"
#
#
#
#  Scenario: Verify User can see full week of slots(Click & Collect )
#
#    Then I see the home page
#    When I open the left hand navigation
#    And I choose ""Book a Slot"" from the left hand navigation
#    Then I am on the book a slot page
#    When I select "Click & Collect" from the book a slot page
#    And I see full week slots displayed in a single screen"






  ##TODO : Need to work on logic , before scenario validation.
  @Continue_btn_validation
  Scenario: Verify tap on 'Continue' on Slot reserved pop up, continues checkout flow if the user has accessed this through initiating checkout


#    Given I go through the tour
#    When I sign in to the application
    Given I see the home page
    And I see "Book a slot" card in home page
    Then I add few item to basket
    When I go to my basket
    And I initiate checkout
    Then I am on the book a slot page
    When I select "Home Delivery" from the book a slot page
    Then I am on a choose a slot page
    And I choose a date with available times
    And I select an available time

    When I book the slot
    Then I see the slot reserved page

    Then I proceed to checkout



  @book_a_slot

  Scenario Outline: As a user , i want to do validation on book a slot page

  ## need to implement scenario outline for both slot reserving options .

    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a Slot" from the left hand navigation
    Then I am on the book a slot page

    When I select "<slot_type>" from the book a slot page
    Then I am on a choose a slot page
    And I choose a date with available times
    And I select an available time

    When I book the slot
    Then I see the slot reserved page


    Then I see the home page

  Examples:
  |slot_type      |
  |Click & collect|
  |Home Delivery  |


@tfs_29473 @sprint_02 @default_view

Scenario: Customer with slot already booked, defaults to that method
## Prerequisite - No slot should be reserved before , so that script can validate dafault view
    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a slot" from the left hand navigation
    Then I am on the book a slot page
    And I verified "Home Delivery" selected by default

    When I selected "Click & Collect"
    Then I book a slot
    Given I see the home page
    When I open the left hand navigation
    And I choose "Book a slot" from the left hand navigation
    Then I am on the book a slot page
    And I verified "Click & Collect" selected by default with slot details

