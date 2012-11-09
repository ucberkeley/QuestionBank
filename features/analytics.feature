Feature: An authorized user can download data about attempts

	Background:
		Given that the app is set up
		Given I am on the analytics page

	Scenario: An authorized user can request attempt data for a student group
		Then I should see "Student Group"
		Given I own the "user_group" "CS169Fall2012"
		Then I should see "CS169Fall2012" 

	Scenario: An authorized user can recieve a csv file with attempt data for a student group
		Given I own the "user_group" "CS169Fall2012"
		When I select "CS169Fall2012" from "user_group"
		When I press "Download"
		Then I should get a download with the filename "CS169Fall2012_attempts.csv"

	Scenario: An authorized user can request attempt data for a question group
		Then I should see "Question Group"
		Given I own the "question_group" "Quiz 1"
		Then I should see "Quiz 1"

	Scenario: An authorized user can recieve a csv file with attempt data for a question group
		Given I own the "question_group" "Quiz 1"
		When I select "Quiz 1" from "question_group"
		And I submit the form
		Then I should get a download with the filename "Quiz_1_attempts.csv"

	Scenario: An authorized user can request attempt data for both a student group and a question group

	Scenario: An authorized user can recieve a csv file with attempt data for both a student group and a question group