Feature: An authorized user can upload data about questions or students
    As a researcher
    so that I can store custom analytics
    I want to be able to upload a CSV file with new data

    Background:
        Given Omniauth is in test mode
        Given the following users exist:
            | Instructor X | 1 |
            | Instructor Y | 2 |
            | Student A    | 3 |
            | Student B    | 4 |
            | Student C    | 5 |
            | Student D    | 6 |

        Given the question group "Question Group 1" exists
        And the question group "Question Group 2" exists
        And the question group "Question Group 3" exists

        Given the following questions exist:
            | Question A | 1 |
            | Question B | 2 |
            | Question C | 3 |

        Given the following attempts exist:
            | Question   | User      | Answer | Correctness |
            | Question A | Student A | Apple  | True        |
            | Question B | Student A | Orange | False       |
            | Question A | Student B | Orange | False       |

        Given "Question A" is in the question group "Question Group 1"
        And "Question A" is in the question group "Question Group 2"
        And "Question B" is in the question group "Question Group 1"

        Given the user group "User Group 1" exists
        And the user group "User Group 2" exists

        Given "Instructor X" is a viewer of "User Group 1"
        And "Instructor Y" is a viewer of "User Group 2"
        And "Student A" is in the user group "User Group 1"
        And "Student A" is in the user group "User Group 2"
        And "Student B" is in the user group "User Group 1"

    Scenario: Anonymous user cannot upload data
        Given I am on the home page
        And I follow "Upload Data"
        Then I should see an error message

    Scenario: A user can add new attribute to questions
        Given I am logged in as "Instructor X"
        And I am on the new attribute page
        When I fill in "new_attribute[name]" with "Difficulty"
        And I press "Add"
        Then I should see "New attribute successfully created"
        And I should see "Difficulty"

    Scenario: A user can upload custom attributes for questions
        Given I am logged in as "Instructor X"
        Given I am on the new attribute page
        And "Difficulty" is added as a question attribute
        When I upload a CSV file "difficulty.csv" with the following content:
        """
        Question Id,Difficulty
        1,80
        2,75
        """
        Then I should see "Data successfully imported!"
        And I am on the questions page
        And I follow "Question A"
        Then I should see "Difficulty"
        And I should see "80"

    Scenario: A user can upload custom attributes for users
        Given I am logged in as "Instructor X"
        Given I am on the new attribute page
        And "Hardworking" is added as a user attribute
        When I upload a CSV file "hardworking.csv" with the following content:
        """
        User Id,Hardworking
        3,True
        4,False
        5,False
        6,False
        """
        Then I should see "Data successfully imported!"
        And I am on the users page
        And I follow "Student A"
        Then I should see "Hardworking"
        And I should see "True"

    Scenario: A user can use custom attributes to download data
        Given I am logged in as "Instructor X"
        And "Difficulty" is added as a question attribute
        And "Hardworking" is added as a user attribute
        When I am on the new download page
        When I select "User Group 1" from "quiz_user_group"
        And I select "Question Group 1" from "quiz_question_group"
        And I select "Difficulty" from "quiz_question_attributes"
        And I select "Hardworking" from "quiz_user_attributes"
        And I press "download_data_submit"
        Then I should get a download with the filename "User_Group_1_Question_Group_1_attempts.csv"
        And I should see "Difficulty"
