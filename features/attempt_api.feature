Feature: A remote web service like EdX can use the API to post attempts

As a third party website
So that I can aggregate my data on the Question Bank
I want to post data to a JSON API


Background:
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
    Given the following attempts exist:
        | Question   | User      | Answer | Correctness |
        | Question A | Student A | Apple  | True        |
        | Question B | Student A | Orange | False       |
        | Question A | Student B | Orange | False       |
Scenario: Adding an attempt from an exisiting user should be recorded
    Given I post to "/api/event/new.json" with:
      """
        {
            "username": "AaronCulich",
            "time": "2012-11-26T00:17:44.150971",
            "event": {
                "success": "incorrect",
                "correct_map": {
                    "i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": {
                        "hint": "",
                        "hintmode": null,
                        "correctness": "incorrect",
                        "msg": "",
                        "npoints": null,
                        "queuestate": null
                    },
                    "i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": {
                        "hint": "",
                        "hintmode": null,
                        "correctness": "incorrect",
                        "msg": "",
                        "npoints": null,
                        "queuestate": null
                    }
                },
                "answers": {
                    "i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_4_1": "8888888888888888",
                    "i4x-MITx-6_002x-problem-H10P1_Magnitude_and_Angle_5_1": "899999999999999999999"
                },
                "problem_id": "i4x://MITx/6.002x/problem/H10P1_Magnitude_and_Angle"
            }
        }
      """
    Given I am on the users page
    Then show me the page
    Then I should see "AaronCulich"
