Feature: Viewing a comment in BBC News

  Scenario: bbc home page
    Given I visit "BBC Home page"
    And the BBC the Home Page is displayed
    When i click on "Brexit: MPs push to prevent no-deal in law"
    And i click on the "View comments" below the page
    Then the "Comments" page is displayed

