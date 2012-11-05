Feature: Attempt to answer a question

	As a user
	So that I can test my knowledge
	I want to attempt to answer a question from Question Bank

Background: 
	Given Omniauth is in test mode
	Given that the app is set up

Scenario: A user can answer a question correctly
	Given I am logged in
	Given I am on the new attempt page
	Then I should see "New attempt"
	When I fill in "attempt_answer" with "An answer."
	And I check "attempt_is_correct"
	
Scenario: A user can answer a question incorrectly
	Given I am logged in
	Given I am on the new attempt page
	Then I should see "New attempt"