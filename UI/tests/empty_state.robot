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

Validate that the empty state message is displayed when the todo list is empty
   Given I open the application  
   When I have not added any todo items  
   Then the empty state message should be displayed
   And the todo items count label should be  0