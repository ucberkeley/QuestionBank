Feature: Access to data about student groups is determined by privilege levels

	As a site manager
	So that I can enforce segregation between groups of users
	I want to assign different tiers of permissions to my users

	Background:
		Given the user group "Group 1" exists
		And the user group "Group 2" exists
		And the user group "Group 3" exists

		Given the following users exist:
		    | Student A    | 1 |
		    | Student B    | 2 |
		    | Instructor X | 3 |
		    | Instructor Y | 4 |
		    | Instructor Z | 5 |

		Given "Student A" is in the user group "Group 1"
		And "Student A" is in the user group "Group 2"
		And "Student B" is in the user group "Group 1"

		Given "Instructor X" is the owner of "Group 1"

		Given Omniauth is in test mode

	Scenario: A user with no privileges cannot see student groups
		Given I am logged in as "Student A"
		And I am on the user groups page
		Then I should not see "Group 1"
		And I should not see "Group 2"

	Scenario: A user with "Viewer" privileges for a set of student groups can access data about those student groups
		Given I am logged in as "Student B"
		And "Student B" is a viewer of "Group 1"
		And I am on the user groups page
		Then I should see "Group 1"
		And I should not see "Group 2"

	Scenario: A user with "Owner" privileges can assign privileges for the groups that he or she owns
		Given I am logged in as "Instructor X"
		And I am on the user group edit page of "Group 1"
		And I select "Instructor Y" from "user_group[owner_user_ids][]"
		And I press "Update User group"
		Then I sign out
		When I am logged in as "Instructor Y"
		And I am on the user groups page
		Then I should see "Group 1"

	Scenario: A user with no "Owner" privileges cannot assign privileges
		Given I am logged in as "Instructor Z"
		And "Instructor Z" is a viewer of "Group 1"
		When I am on the user groups page
		Then I should see "Group 1"
		And I visit the user group edit page of "Group 1"
		Then I should see "You are not authorized to access this page."
