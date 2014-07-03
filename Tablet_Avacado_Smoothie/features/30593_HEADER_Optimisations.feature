Feature: As a user i want to verify UI changes for header in tablet devices

  @manual
  Scenario: As a user i want to verify the UI elements such as Navigation Bar, Tesco logo, search icon, browse icon , 0 items  bucket in the header before/after login and verify the header UI after navigating to different screen
    Given I am in the home page
    Then I validate the UI elements in the header
    When i Navigate to different screen from LHN
    Then i Verify the up navigation and section title in the header.