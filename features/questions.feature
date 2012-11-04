Feature: Contribute a question to the system

	As a question provider
	So that I can share my knowledge
	I want to add a question to the bank

Scenario: Add a new question
	Given I am on add question page
	Then I should see "New question"
	When I fill in "question_xml" with "A sample question"
	And press "Create Question"
	Then I should see "Question was successfully created."
	And I should see "A sample question"

Scenario: Remove a question
	Given I am on add question page
	Then I should see "New question"
	When I fill in "question_xml" with "A sample question"
	And press "Create Question"
	Then I should see "Question was successfully created."
	And I should see "A sample question"
	And I am on the questions page
	Then I follow "Destroy"
	Then I should not see "A sample question"
