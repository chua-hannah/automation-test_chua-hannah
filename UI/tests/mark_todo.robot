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

Validate that I can check a completed todo item
   Given I open the application
   When I add a todo item titled    Buy Groceries
   Then the todo item should be displayed as    Buy Groceries
   And the todo input field should be empty
   When I mark the complete checkbox to complete a todo item in my list    Buy Groceries
   Then the todo item checkbox should be marked as complete    Buy Groceries

Validate that I can uncheck a completed todo item
    Given I open the application
    And I add a todo item titled    Buy Groceries
    And I mark the complete checkbox to complete a todo item in my list    Buy Groceries
    Then the todo item checkbox should be marked as complete    Buy Groceries
    When I uncheck the complete checkbox to mark a todo item as incomplete    Buy Groceries
    Then the todo item checkbox should be marked as incomplete    Buy Groceries