Feature: An authorized user can upload data about questions or students
    In order to add data to the database
    As a user
    I want to be able to upload a CSV file with new data

	Background:
		Given the following users exist:
		    | Instructor X | 1 |
		    | Instructor Y | 2 |

		Given the following questions exist:
			| Question A | 1 |

		Given the question group "Question Group 1" exists
		And "Question A" is in the question group "Question Group 1"
		
		Given "Instructor X" is a viewer of "Question Group 1"

		Given Omniauth is in test mode

	Scenario: A user with "viewer" privileges can upload custom attributes
		Given I am logged in as "Instructor X"
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 1 		| 5				|
		Then the attribute with the name "Difficulty" and the value "5" for question "Question A" and user "Instructor X" should be stored in the database
		  
	Scenario: A user without "viewer" privileges cannot upload custom attributes
		Given I am logged in as "Instructor Y"
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 1 		| 5				|
		Then I should see an error message

	Scenario: A user can overwrite custom attributes
		Given I am logged in as "Instructor Y"
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 1 		| 5				|
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 1 		| 7				|
		Then the attribute with the name "Difficulty" and the value "7" for question "Question A" and user "Instructor X" should be stored in the database

	Scenario: A user can use custom attributes to download data
		Given I am logged in as "Instructor X"
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 1 		| 5				|
		When I go to the download data page
		Then I should see "Difficulty"

	Scenario: A user cannot upload custom attributes for nonexistent questions 
		Given I am logged in as "Instructor X"
		When I upload a CSV file with the following data:
			| Question 	| Difficulty 	|
			| 4 		| 5				|
		Then I should see an error message