Feature: An authorized user can download data about attempts

	Background:
		Given the user group "User Group 1" exists
		And the user group "User Group 2" exists
		And the user group "User Group 3" exists

		Given the following users exist:
		    | Student A    | 1 |
		    | Student B    | 2 |
		    | Instructor X | 3 |
		    | Instructor Y | 4 |

		Given "Student A" is in the user group "User Group 1"
		And "Student A" is in the user group "User Group 2"
		And "Student B" is in the user group "User Group 1"

		Given the question group "Question Group 1" exists
		And the question group "Question Group 2" exists
		And the question group "Question Group 3" exists

		Given the following questions exist:
			| Question A | 1 |
			| Question B | 2 |
			| Question C | 3 |

		Given "Question A" is in the question group "Question Group 1"
		And "Question A" is in the question group "Question Group 2"
		And "Question B" is in the question group "Question Group 1"

		Given the following attempts exist:
			| Question   | User      | Answer | Correctness |
			| Question A | Student A | Apple  | True        |
			| Question B | Student A | Orange | False       |
			| Question A | Student B | Orange | False       |

		Given "Instructor X" is the owner of "User Group 1"
		Given "Instructor X" is a viewer of "User Group 2"
		Given "Instructor X" is the owner of question group "Question Group 1"
		Given "Instructor X" is a viewer of question group "Question Group 1"
		Given "Instructor Y" is a viewer of "User Group 1"
		Given "Instructor Y" is the owner of question group "Question Group 2"

		Given Omniauth is in test mode

	Scenario: A user with "viewer" privileges can request data for a user group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		Then I should see "User Group 1"

	Scenario: A user without "viewer" privileges cannot request data for a user group
		Given I am logged in as "Student A"
		And I am on the download data page
		Then I should not see "User Group 1"

	Scenario: A user with "viewer" privileges can request data for a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		Then I should see "Question Group 1"

	Scenario: A user without "viewer" privileges cannot request data for a question group
		Given I am logged in as "Student A"
		And I am on the download data page
		Then I should not see "Question Group 1"

	Scenario: A user with "viewer" privileges can download data for a user group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I select "User Group 2" from "user_group_id"
		And I press "download_data_submit"
		Then I should get a download with the filename "User_Group_2_attempts.csv"
		And I should see "Student A"
		And I should not see "Student B"

	Scenario: A user with "viewer" privileges can download data for a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I select "Question Group 1" from "question_group_id"
		And I press "download_data_submit"
		Then I should get a download with the filename "Question_Group_1_attempts.csv"

	Scenario: A user with "viewer" privileges can download data for a user group and a question group
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I select "User Group 1" from "user_group_id"
		And I select "Question Group 1" from "question_group_id"
		And I press "download_data_submit"
		Then I should get a download with the filename "User_Group_1_Question_Group_1_attempts.csv"

	Scenario: A user cannot download data without parameters
		Given I am logged in as "Instructor X"
		And I am on the download data page
		When I press "download_data_submit"
		Then I should be on the download data page
		And I should see an error message