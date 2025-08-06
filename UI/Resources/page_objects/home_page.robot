*** Settings ***
Library     AppiumLibrary
Library    ../assets/todo_utils.py
Resource    ../common.robot

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page
# Scalar Variables
${expected_home_desc}   Todo App
${lbl_home_brand}    xpath=//android.view.View[@content-desc="${expected_home_desc}"]
${btn_add}      xpath=//android.widget.Button[@content-desc="Add"]
${txt_todo_container}    xpath=(//android.widget.EditText)[1]
${txt_todo_input}    xpath=(//android.widget.EditText)[2]
${lbl_todo_counter}     xpath=//android.view.View[contains(@content-desc, "todo-counter")]
${lbl_empty_state}  xpath=//android.view.View[contains(@content-desc, "empty-state")]
${btn_save_edit_todo}   xpath=//android.widget.Button[contains(@content-desc, "save-edit")]
${btn_cancel_edit_todo}   xpath=//android.widget.Button[contains(@content-desc, "cancel-edit")]

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

I open the application
    Wait Until Element Is Visible    ${lbl_home_brand}    10s
    ${actual_desc}=    Get Element Attribute    ${lbl_home_brand}    content-desc
    Should Be Equal    ${actual_desc}    ${expected_home_desc}

I click the add button
    Wait Until Element Is Visible    ${btn_add}   10s
    Click Element   ${btn_add}

I add a todo item titled
    [Arguments]    ${todo_item}
    Click Element    ${txt_todo_container}
    ${focused}=    Get Element Attribute    ${txt_todo_input}    focused
    Should Be Equal    ${focused}    true
    Input Text    ${txt_todo_input}    ${todo_item}
    I click the add button

the Todo item should be displayed as
    [Arguments]    ${todo_item}
    Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc, "${todo_item}")]   10s
    Element Should Be Visible   xpath=//android.view.View[contains(@content-desc, "${todo_item}")]

the Todo input field should be empty
    [Documentation]    Validates that the todo input field is empty after adding a todo item
    ${text}=    Get Text    ${txt_todo_input}
    Should Be Empty    ${text}

I add multiple todo items
    [Arguments]    @{todo_items}
    FOR     ${item}    IN    @{todo_items}
        I add a Todo item titled   ${item}
        the Todo item should be displayed as    ${item}
    END

I delete a todo item titled
    [Arguments]    ${exist_todo_item}
    Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc, "${exist_todo_item}")]   10s
    Click Element    xpath=//android.view.View[contains(@content-desc, "${exist_todo_item}")]/child::android.widget.Button[contains(@content-desc, "delete")]
   
the Todo item should be deleted successfully
    [Arguments]    ${exist_todo_item}
    Run Keyword And Expect Error    *    Element Should Be Visible    xpath=//android.view.View[contains(@content-desc, "${exist_todo_item}")]

Get checkbox locator for todo item
    [Arguments]    ${todo_title}
    ${locator}=    Set Variable    xpath=//android.view.View[contains(@content-desc, "${todo_title}")]//android.widget.CheckBox[@content-desc]
    RETURN    ${locator}

I mark the complete checkbox to complete a todo item in my list
    [Arguments]    ${todo_title}
    ${checkbox}=    Get checkbox locator for todo item    ${todo_title}
    Wait Until Element Is Visible    ${checkbox}    10s
    ${checked}=    Get Element Attribute    ${checkbox}    checked
    Should Be Equal    ${checked}    false
    Click Element    ${checkbox}

the Todo item checkbox should be marked as complete
    [Arguments]    ${todo_title}
    ${checkbox}=    Get checkbox locator for todo item    ${todo_title}
    ${checked}=    Get Element Attribute    ${checkbox}    checked
    Should Be Equal    ${checked}    true
    
I uncheck the complete checkbox to mark a todo item as incomplete
    [Arguments]    ${todo_title}
    ${checkbox}=    Get checkbox locator for todo item    ${todo_title}
    Wait Until Element Is Visible    ${checkbox}    10s
    ${checked}=    Get Element Attribute    ${checkbox}    checked
    Should Be Equal    ${checked}    true
    Click Element    ${checkbox}

the Todo item checkbox should be marked as incomplete
    [Arguments]    ${todo_title}
    ${checkbox}=    Get checkbox locator for todo item    ${todo_title}
    ${checked}=    Get Element Attribute    ${checkbox}    checked
    Should Be Equal    ${checked}    false

I have not added any todo items
    Element Should Be Visible    ${lbl_empty_state}

the empty state message should be displayed
    [Documentation]    Validates the empty state message is displayed when no todo items are present
    [Arguments]    ${expected_partial_message}=No todos yet
    ${actual_message}=    Get Element Attribute    ${lbl_empty_state}    content-desc
    Should Contain    ${actual_message}    ${expected_partial_message}

the todo items count label should be
    [Documentation]    Gets the count of todo items in the UI based on the label text
    [Arguments]    ${expected_count}
    ${label_text}=    Get Element Attribute    ${lbl_todo_counter}    content-desc
    ${actual_count}=    Extract Todo Count    ${label_text}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}     Label count incorrect

the total number of todo items in the list should be
    [Documentation]    Gets the count of actual todo items in the UI based on matching views
    [Arguments]    ${expected_count}
    ${todo_elements}=    Get WebElements    xpath=//android.view.View[contains(@content-desc, "todo-item-")]
    ${actual_count}=    Get Length    ${todo_elements}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}     List count incorrect

the number of completed items should be
    [Documentation]    Gets the count of completed todo items in the UI based on matching views
    [Arguments]    ${expected_count}
    ${elements}=    Get WebElements    xpath=//android.widget.CheckBox[@content-desc and @checked='true']
    ${actual_count}=    Get Length    ${elements}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

the number of uncompleted items should be
    [Documentation]    Gets the count of uncompleted todo items in the UI based on matching views
    [Arguments]    ${expected_count}
    ${elements}=    Get WebElements    xpath=//android.widget.CheckBox[@content-desc and @checked='false']
    ${actual_count}=    Get Length    ${elements}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

I click the edit button for the todo item titled
    [Arguments]    ${todo_title}
    ${btn_edit}=    Set Variable    xpath=//android.view.View[ends-with(@content-desc, "${todo_title}")]//android.widget.Button[contains(@content-desc, "edit")]
    Click Element    ${btn_edit}
    
I clear the input field
    [Arguments]    ${locator}
    ${focused}=    Get Element Attribute    ${locator}    focused
    Should Be Equal    ${focused}    true
    Clear Text    ${locator}

I update the todo item titled
    [Arguments]    ${old_title}    ${new_title}
    ${txt_initial_input}=    Set Variable    xpath=//android.widget.EditText[@text="${old_title}"]
    Click Element   ${txt_initial_input}
    I clear the input field     ${txt_initial_input}
    ${txt_focused_input}=    Set Variable    xpath=//android.widget.EditText[@focused='true']
    Input Text    ${txt_focused_input}    ${new_title}
    Click Element    ${btn_save_edit_todo}

Then the todo item titled should be visible
    [Arguments]     ${new_todo_item}
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@content-desc, "${new_todo_item}")]   10s
    Element Should Be Visible   xpath=//android.view.View[contains(@content-desc, "${new_todo_item}")]

the old todo item should not be visible
    [Arguments]     ${old_todo_item}
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@content-desc, "${old_todo_item}")]   10s
    Run Keyword And Expect Error    *    Element Should Be Visible   xpath=//android.view.View[contains(@content-desc, "${old_todo_item}")]

I click the close button to cancel editing
    Wait Until Element Is Visible   ${btn_cancel_edit_todo}   10s
    Click Element   ${btn_cancel_edit_todo}

I type a todo item with length
    [Documentation]    Types a todo item with a specified length and returns the generated string
    [Arguments]    ${input_length}
    Click Element    ${txt_todo_container}
    ${focused}=    Get Element Attribute    ${txt_todo_input}    focused
    Should Be Equal    ${focused}    true
    ${todo_item}=    Generate Random String    ${input_length}    [LETTERS]
    Input Text    ${txt_todo_input}    ${todo_item}
    RETURN  ${todo_item}

Character counter should be
    [Documentation]    Validates the character counter for the todo input field
    [Arguments]    ${input_length}
    ${max_limit}=    Set Variable    200
    ${remaining}=    Evaluate   ${max_limit} - ${input_length}
    Run Keyword If    ${remaining} == 0
    ...    Element Should Be Visible    xpath=//android.view.View[@content-desc="No characters remaining"]
    ...  ELSE
    ...    Element Should Be Visible    xpath=//android.view.View[contains(@content-desc, "${remaining} characters remaining")]
    
