Feature: Authenticate with Twitter

	As a user
	So that I can prove who I am
	I want to authenticate with Twitter

Background:
	Given Omniauth is in test mode

Scenario: Login
	Given I am on the homepage
	And I am not logged in
	Then I should see "Login"
	When I sign in
	Then I should see "Logout"

Scenario: Logout
	Given I am on the homepage
	And I am logged in
	Then I should see "Logout"
	When I sign out
	Then I should see "Login"

Scenario: Enter email
	Given I am on the homepage
	And I am logged in
	And I fill in "user_email" with "someone@somewhere.com"
	And I press "Sign in"
	Then I should see "Email" 
	And I should see "someone@somewhere.com"
