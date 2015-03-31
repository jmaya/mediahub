Feature: Authentication
  In order to authenticate users we will devise an authentication system.

  Scenario: Register a new user
    Given I am in the root page
    When I click on the register link 
    And I fill in email with "test@test.com" 
    And I fill in "user_password" with "password" 
    And I fill in "user_password_confirmation" with "password" 
    And I click on the "Sign up" button
    Then I should see "Welcome! You have signed up successfully."
