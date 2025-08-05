*** Settings ***
# Always add `Common.robot` resource file
# List of setup and teardown methods to be used within the script
Resource    ../Resources/Common.robot
Resource    ../Resources/PageObjects/LoginPO.robot
Test Setup  Setup Test Environment
Test Teardown     End Result
Force Tags  AllTestAutomationScenarios

*** Test Cases ***
# List of test cases
# To follow Gherkin format, for reference:
#    Scenario — a label for the behavior you’re going to describe
#        Given — the beginning state of the scenario
#        When — a specific action that the user takes
#        Then — a testable outcome, usually caused by the action in When
#        And | But — additional precondition used

Validate that I am able to add a Todo item   
   Given I open the application
   When I add a todo item titled    Buy Groceries
   Then The Todo item should be displayed as    Buy Groceries
   And The todo items count should be  1
   And The Todo input field should be empty

Validate that I can add multiple Todo items
   Given I open the application
   When I add multiple todo items    @{todo_items}
   ${expected_count}=    Get Length    ${todo_items}
   Then The todo items count should be    ${expected_count}


Validate character counter for empty todo input
   Given I open the application
   When I type a todo item with length    0
   Then Character counter should be    0

Validate that nothing happens when I click add with empty input
   Given I open the application
   When I type a todo item with length    0
   And I click the add button
   Then The empty state message should be displayed

Validate character counter for 50 characters
   Given I open the application
   When I type a todo item with length    50
   Then Character counter should be    50

Validate character counter for 200 characters
   Given I open the application
   When I type a todo item with length    200
   Then Character counter should be    200

Validate that I am able to add a Todo item with 200 characters
   Given I open the application
   ${todo_item}=    When I type a todo item with length   200
   And I click the add button
   Then The Todo item should be displayed as    ${todo_item}