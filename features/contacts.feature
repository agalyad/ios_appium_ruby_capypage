Feature: Manage contacts

  Scenario: Create a contact
    When i click on Create New Contact
    And i enter "Bruce" as the first name
    And i enter "Wayne" as the last name
    And i click on Done
    Then i am in the Home screen
    And i click on Display Picker
    And i see "Bruce Wayne" in contacts list