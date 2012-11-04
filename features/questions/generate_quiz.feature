Feature: Generating a Quiz
As an instructor
In order to have a quiz with questions on specific topic
I want to generate a quiz from Question Bank's questions

Background:
Given that the app is set up

Scenario: An instructor is allowed to generate a quiz
Given I am logged in as an instructor
#Then show me the page
When I try to generate a quiz
Then I should see "Generate a Quiz"

Scenario: An non-instructor is not allowed to generate a quiz
Given I am logged in as a non-instructor
When I try to generate a quiz
Then I should see "Only instructors are allowed to generate quizzes."

Scenario: An instructor can control the length of the quiz
Given I am logged in as an instructor
When I try to generate a quiz with 2 questions
Then the quiz should have 2 questions

Scenario: An instructor can choose a topic for a quiz
Given I am logged in as an instructor
When I try to generate a quiz with the topic "meteorology"
Then the quiz should have the topic "meteorology" 

