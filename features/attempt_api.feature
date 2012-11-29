Feature: A remote web service like EdX can use the API to post attempts

Background:
	Given the following attempts exist:
		| user_id | question_id |
      		| 1  	  | q1		|
      		| 2       | q2  	|
      		| 3       | q3		|
	Given the following questions exist:
		| user_id | question_id |
      		| 1  	  | q1		|
      		| 2       | q2  	|
      		| 3       | q3		|
	Given the following users exist:
		| user_id | name 	|
      		| 1  	  | AaronCulich	|
      		| 2       | q2  	|
      		| 3       | q3		|

Scenario: Adding an attempt from an exisiting user should be recorded
    When I send a POST request to "/api/event/new" with:
      """
      {
        "username": "AaronCulich"
	"time": "2012-11-26T00:17:44.150971"
	"event": {
		"success": "incorrect", 
		"correct_map": {
				"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": 
					{"hint": "", "hintmode": null, "correctness": "incorrect", 
					"msg": "", "npoints": null, "queuestate": null}, 
				"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": 
					{"hint": "", "hintmode": null, "correctness": "incorrect", 
					"msg": "", "npoints": null, "queuestate": null}
				}, 
		"answers": {
			"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": "8888888888888888", 
			"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": "899999999999999999999"
		"problem_id": "i4x://MITx/6.002x/problem/H10P1_Magnitude_and_Angle"
		}
      }
      """
    When I go to the list of attempts
    Then I should see "AaronCulich"

Scenario: Adding an attempt from an non-existing user should not be recorded
    When I send a POST request to "/api/event/new" with:
      """
      {
        "username": "NonExisting"
	"time": "2012-11-26T00:17:44.150971"
	"event": {
		"success": "incorrect", 
		"correct_map": {
				"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": 
					{"hint": "", "hintmode": null, "correctness": "incorrect", 
					"msg": "", "npoints": null, "queuestate": null}, 
				"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": 
					{"hint": "", "hintmode": null, "correctness": "incorrect", 
					"msg": "", "npoints": null, "queuestate": null}
				}, 
		"answers": {
			"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": "8888888888888888", 
			"i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": "899999999999999999999"
		"problem_id": "i4x://MITx/6.002x/problem/H10P1_Magnitude_and_Angle"
		}
      }
      """
    When I go to the list of attempts
    Then I should not see "NonExisting"
