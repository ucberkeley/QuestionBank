Feature: A remote web service like EdX can use the API to post attempts

Background:
    Given PENDING
    Given the following attempts exist:
        | Question   | User      | Answer | Correctness |
        | Question A | Student A | Apple  | True        |
        | Question B | Student A | Orange | False       |
        | Question A | Student B | Orange | False       |
    Given the following questions exist:
        | Question A | 1 |
        | Question B | 2 |
        | Question C | 3 |
        | Question D | 4 |
    Given the following users exist:
        | Student A    | 1 |
        | Student B    | 2 |
        | Instructor X | 3 |
        | Instructor Y | 4 |

Scenario: Adding an attempt from an exisiting user should be recorded
    Given PENDING
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
            },
            "problem_id": "i4x://MITx/6.002x/problem/H10P1_Magnitude_and_Angle"
        }
      }
      """
    When I go to the list of attempts
    Then I should see "AaronCulich"

Scenario: Adding an attempt from an non-existing user should not be recorded
    Given PENDING
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
            },
            "problem_id": "i4x://MITx/6.002x/problem/H10P1_Magnitude_and_Angle"
        }
      }
      """
    When I go to the list of attempts
    Then I should not see "NonExisting"
