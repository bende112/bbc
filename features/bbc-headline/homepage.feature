Feature: Viewing a comment in BBC News


  Scenario: login to bbc website
    Given I visit "<BBC Home page>"
    And i click on the "Sign in" on the tool bar
    And the "Sign in" page modal is displayed
    And i enter "nkubende@yahoo.com" on the email field
    And i enter "Kottopikin87" on the password field
    When i click on the "Sign in" button
    Then "Welcome to the BBC" home page is displayed
    And i click on "UK asks EU for Brexit extension until 30 June"
    And i click on the "View comments" below the page
    And the "Comments" page is displayed




