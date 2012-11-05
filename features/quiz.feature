Feature: Generating a Quiz
As a user
In order to have a quiz with questions on a specific topic
I want to generate a quiz from Question Bank's questions

Background:
Given that the app is set up

Scenario: A logged-in user can generate a quiz
Given I am logged in
And I am on the homepage
Then I should see "Generate a quiz"
When I follow "Generate a quiz"
Then I should see "Number of questions"

Scenario: Anonymous user should not be able to generate a quiz
Given I am not logged in
And I am on the homepage
Then I should see "Generate a quiz"
When I follow "Generate a quiz"
Then I should see "Please log in first"

Scenario: A logged-in can choose a topic for a quiz
Given I am logged in
And I am on the quiz generation page
Then I should see "Tag"
And I should see "Number of questions"
When I select "philosophy" from "question_tag"
And I fill in "question_number_of_questions" with "7"
And I press "Save Question"
Then I should see "What is the meaning of life?"
And I should see "philosophy"


Scenario: A user cannot generate a quiz without a topic
Given I am logged in
And I am on the quiz generation page
When I fill in "question[number_of_questions]" with "5"
And I press "Save Question"
Then I should see "Please provide a tag"
