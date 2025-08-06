*** Settings ***
# Always add `Common.robot` resource file
# List of setup and teardown methods to be used within the script
Resource    ../Resources/Common.robot
Resource    ../Resources/PageObjects/LoginPO.robot
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

Validate that I am able to delete a Todo item   
   Given I open the application
   When I add a todo item titled    Buy Groceries
   Then the todo item should be displayed as    Buy Groceries
   And the todo input field should be empty
   When I delete a todo item titled    Buy Groceries
   Then the todo item should be deleted successfully   Buy Groceries
   And the empty state message should be displayed

Validate that I am able to delete multiple Todo items
    Given I open the application
    When I add multiple todo items    @{todo_items}
    And the todo input field should be empty
    ${remaining_count}=    Get Length    ${todo_items}
    Then the todo items count label should be    ${remaining_count}
    And the total number of todo items in the list should be    ${remaining_count}
    
    FOR    ${item}    IN    @{todo_items}
        When I delete a todo item titled    ${item}
        Then the todo item should be deleted successfully    ${item}
        ${remaining_count}=    Evaluate    ${remaining_count} - 1
        Log    Deleted '${item}'. Remaining count: ${remaining_count}
        Then the todo items count label should be    ${remaining_count}
        Run Keyword If    ${remaining_count} != 0
        ...    the total number of todo items in the list should be    ${remaining_count}
        ...     ELSE
        ...    the empty state message should be displayed
    END
