Feature: Access to data about student groups is determined by privilege levels

Scenario: A user with no privileges cannot access data about any of the student groups

Scenario: A user with "Viewer" privileges for a set of student groups can access data about those student groups

Scenario: A user with "Owner" privileges for a set of student groups also has "Viewer" privileges for those groups

Scenario: A user with "Owner" privileges can assign "Viewer" privileges for the groups that he or she owns

Scenario: A user with "Owner" privileges can assign "Owner" privileges for the groups that he or she owns

Scenario: A user with "God" privileges has "Owner" privileges for all student groups