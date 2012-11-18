Feature: An authorized user can download data about attempts

	Background:
		Given the "user_group" "CS169Fall2012" exists
		Given I own the "user_group" "CS169Fall2012"
		Given the "question_group" "Quiz 1" exists
		Given I own the "question_group" "Quiz 1"
		Given I am on the download data page

	Scenario: A user cannot request data without parameters 
		When I press "download_data_submit"
		Then I should be on the download data page
		And I should see "flash_error"

	Scenario: An authorized user can request data for a student group
		Given PENDING
		Then I should see "CS169Fall2012" 

	Scenario: An authorized user can download data for a student group
		Given PENDING
		When I select "CS169Fall2012" from "user_group"
		And I press "download_data_submit"
		Then I should get a download with the filename "CS169Fall2012_attempts.csv"

	Scenario: An authorized user can request data for a question group
		Given PENDING
		Then I should see "Quiz 1"

	Scenario: An authorized user can download data for a question group
		Given PENDING
		When I select "Quiz 1" from "question_group"
		And I press "download_data_submit"
		Then I should get a download with the filename "Quiz_1_attempts.csv"

	Scenario: An authorized user can download data for both a student group and a question group
		Given PENDING
		When I select "CS169Fall2012" from "user_group"
		And I select "and" from "operator"
		And I select "Quiz 1" from "question_group"
		And I press "download_data_submit"
		Then I should get a download with the filename "CS169Fall2012_and_Quiz_1_attempts.csv"

	Scenario: An authorized user can download data for either a student group or a question group
		Given PENDING
		When I select "CS169Fall2012" from "user_group"
		And I select "or" from "operator"
		And I select "Quiz 1" from "question_group"
		And I press "download_data_submit"
		Then I should get a download with the filename "CS169Fall2012_or_Quiz_1_attempts.csv"
		