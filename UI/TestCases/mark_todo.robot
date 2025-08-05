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

Validate that I can check a completed Todo item
   Given I open the application
   When I add a todo item titled    Buy Groceries
   Then The Todo item should be displayed as    Buy Groceries
   And The Todo input field should be empty
   When I mark the complete checkbox to complete a todo item in my list    Buy Groceries
   Then The Todo item checkbox should be marked as complete    Buy Groceries
   Mark Test Status  Passed  This test case is Passed!

Validate that I can uncheck a completed Todo item
    Given I open the application
    And I add a Todo item titled    Buy Groceries
    And I mark the complete checkbox to complete a Todo item in my list    Buy Groceries
    Then The Todo item checkbox should be marked as complete    Buy Groceries
    When I uncheck the complete checkbox to mark a Todo item as incomplete    Buy Groceries
    Then The Todo item checkbox should be marked as incomplete    Buy Groceries
    Mark Test Status  Passed  This test case is Passed!
