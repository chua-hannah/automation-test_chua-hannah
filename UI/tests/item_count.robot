*** Settings ***
# Always add `common.robot` resource file
# List of setup and teardown methods to be used within the script
Resource    ../resources/common.robot
Resource    ../resources/page_objects/home_page.robot
Test Setup  Setup Test Environment
Test Teardown     End Result
Force Tags  e2e

*** Test Cases ***
# List of test cases
# To follow Gherkin format, for reference:
#    Scenario — a label for the behavior you’re going to describe
#        Given — the beginning state of the scenario
#        When — a specific action that the user takes
#        Then — a testable outcome, usually caused by the action in When
#        And | But — additional precondition used

Validate total count of todo items in the list
    Given I open the application
    When I add multiple todo items    @{todo_items}
    ${expected_count}=    Get Length    ${todo_items}
    Then the todo items count label should be    ${expected_count}
    And the total number of todo items in the list should be   ${expected_count}

Validate total count of all completed and uncompleted todo items in the list
    Given I open the application
    When I add multiple todo items    @{todo_items}
    And I mark the complete checkbox to complete a todo item in my list    ${todo_items[0]}
    And I mark the complete checkbox to complete a todo item in my list    ${todo_items[1]}
    ${expected_total}=    Get Length    ${todo_items}
    ${expected_completed}=    Set Variable    2
    ${expected_uncompleted}=    Evaluate    ${expected_total} - ${expected_completed}
    Then the todo items count label should be    ${expected_total}
    And the total number of todo items in the list should be    ${expected_total}
    And the number of completed items should be    ${expected_completed}
    And the number of uncompleted items should be    ${expected_uncompleted}
