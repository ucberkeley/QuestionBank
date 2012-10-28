Feature: Generating a Quiz
In order to have a quiz with questions that my students haven't seen before
As an instructor
I want to generate a quiz from Question Bank's questions

Scenario: An instructor is allowed to generate a quiz
Given I am logged in as an instructor
When I follow "Generate Quiz"
Then I should see "Generate a Quiz"

Scenario: An non-instructor is not allowed to generate a quiz
Given I am logged in as a non-privileged user
When I follow "Generate Quiz"
Then I should see "Only instructors are allowed to generate quizzes."

Scenario: An instructor can control the length of the quiz
Given I am logged in as an instructor
When I follow "Generate Quiz"
And I fill in "Number of Questions" with "5"
And I press "Create Quiz"
Then the length of the quiz should be 5 questions

Scenario: An instructor can choose a topic for a quiz
Given I am logged in as an instructor
When I follow "Generate Quiz"
And I select "rerum" from "Tags"
And I press "Create Quiz"
Then the topic of the quiz should be "rerum" 

