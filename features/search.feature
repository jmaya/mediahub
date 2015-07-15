Feature: Search
  In order to provide search functionality, users will be able to perform searches on courses.

  Scenario: Perform a search as a non admin
    Given I am a new, authenticated as "user"
    And I am in the root page
    When I fill in search with "ruby"
    And I click on the submit button
    Then I should see a results page with "ruby" listed
