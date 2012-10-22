Feature: Authentication
In order to create and edit questions
As a user
I want to sign in with Facebook

  Scenario: Login via Facebook
    When I go to "the homepage"
    And I follow "Login via Facebook"
    And Facebook authorizes me
    Then I should see "Logged in as"

  Scenario: Checking login status
    Given I am signed in
    When I go to "the homepage"
    Then I should see "Logged in as"

  Scenario: Log out
    Given I am signed in
    When I go to "the homepage"
    And I follow "Log out"
    Then I should see "Login via Facebook"
