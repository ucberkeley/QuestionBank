Feature: Access to data about student groups is determined by privilege levels

	Background:
		Given the "user_group" "CS169Fall2012" exists
		And the "user_group" "CS169Fall2013" exists
		Given "student 1" is in the group "CS169Fall2012"
		Given I own the "user_group" "CS169Fall2012"
		Given the "question_group" "Quiz 1" exists
		Given I own the "question_group" "Quiz 1"
		Given I am on the download data page

	Scenario: A user with no privileges cannot access data about any of the student groups
		Given PENDING
		Given I have no privileges in group "CS169Fall2012"
		And I try to view analytics of "CS169Fall2012"
		Then I should see "You do have required permissions to view this group"

	Scenario: A user with "Viewer" privileges for a set of student groups can access data about those student groups
		Given PENDING
		Given I have "Viewer" privilege in group "CS169Fall2012"
		And I try to view analytics of "CS169Fall2012"
		Then I should see "student 1"

	Scenario: A user with "Owner" privileges can assign "Viewer" privileges for the groups that he or she owns
		Given PENDING
		Given I have "Owner" privilege in group "CS169Fall2012"
		And I assign "Viewer" priviledge to "student 1"
		And I am on group permissions page
		Then I should see "student 1" as a "Viewer"

	Scenario: A user with "Owner" privileges can assign "Owner" privileges for the groups that he or she owns
		Given PENDING
		Given I have "Owner" privilege in group "CS169Fall2012"
		And I assign "Owner" priviledge to "student 1"
		And I am on group permissions page
		Then I should see "student 1" as a "Owner"

	Scenario: A user with "Administrator" privileges has "Owner" privileges for all student groups
		Given PENDING
		Given I have "Administrator" privilege
		And I am on view analytics page
		Then I should see 2 groups
