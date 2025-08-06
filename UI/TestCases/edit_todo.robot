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

Validate that I can successfully update a todo item
    Given I open the application
    And I add a todo item titled    Buy Groceries
    Then the todo item should be displayed as    Buy Groceries
    When I click the edit button for the todo item titled    Buy Groceries
    And I update the todo item titled    Buy Groceries    Bathe my dog
    Then the todo item titled should be visible     Bathe my dog
    And the old todo item should not be visible     Buy Groceries 

Validate that I can cancel editing a Todo item
    Given I open the application
    And I add a todo item titled    Buy Groceries
    Then the todo item should be displayed as    Buy Groceries
    When I click the edit button for the todo item titled    Buy Groceries
    And I click the close button to cancel editing
    Then the todo item titled should be visible    Buy Groceries

