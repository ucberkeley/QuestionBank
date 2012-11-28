Feature: An authorized user can upload data about questions or students

	Background:
		Given the following users exist:
		    | Instructor X | 1 |
		    | Instructor Y | 2 |

		Given the following questions exist:
			| Question A | 1 |
			| Question B | 2 |
			| Question C | 3 |

		Given the question group "Question Group 1" exists
		And "Question A" is in the question group "Question Group 1"
		And "Question B" is in the question group "Question Group 1"

		Given "Instructor X" is a viewer of "Question Group 1"

		Given Omniauth is in test mode

	Scenario: A user with "viewer" privileges can upload new attributes for questions in a question group
		Given I am logged in as "Instructor X"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question 	| Difficulty
			1 			| 3
			2 			| 4	
		And I press "upload_data_submit"
		Then I should see "File successfully uploaded"

	Scenario: A user without "viewer" privileges cannot upload new attributes for questions in a question group
		Given I am logged in as "Instructor Y"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question 	| Difficulty
			1 			| 3
			2 			| 4	
		And I press "upload_data_submit"
		Then I should see an error message

	Scenario: A user can overwrite uploaded attributes
		Given I am logged in as "Instructor Y"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question 	| Difficulty
			1 			| 3
			2 			| 4	
		And I press "upload_data_submit"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question 	| Difficulty
			1 			| 5
			2 			| 6	
		Then I should see "File successfully uploaded."

	Scenario: A user can select questions to download based on the uploaded attributes
		Given I am logged in as "Instructor X"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question 	| Difficulty
			1 			| 3
			2 			| 4	
		And I press "upload_data_submit"
		When I go to the download data page
		Then I should see "Difficulty"

	Scenario: A user cannot upload new attributes for non-existant questions 
		Given I am logged in as "Instructor X"
		And I am on the upload data page
		And I select a CSV file with the following data:
			Question Group	| Difficulty
			3 				| 3
			4 				| 4	
		And I press "upload_data_submit"
		Then I should see an error message