*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary 
Resource    ../Common.robot

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page
# Scalar Variables
${btn_add}      xpath=//android.widget.Button[@content-desc="Add"]
${txt_todo_item}    xpath=//android.widget.EditText[@text='Todo item']
${lbl_char_count}     xpath=//android.view.View[@content-desc="200 characters remaining"]
${lbl_items_count}     xpath=//android.view.View[@content-desc="todo-counter 0 items"]
${lbl_empty_state}  xpath=//android.view.View[@content-desc="empty-state No todos yet. Add one above!"]
${chk_complete_todo}    xpath=//android.widget.CheckBox[@content-desc="Mark complete, todo-checkbox-1"]/android.widget.CheckBox
${btn_edit_todo}    xpath=//android.widget.Button[@content-desc="Edit todo, edit-button-1"]/android.widget.Button
${btn_delete_todo}    xpath=//android.widget.Button[@content-desc="Delete todo, delete-button-1"]/android.widget.Button

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

I unregister one device
    Wait Until Element Is Visible   ${botnav_btn_account}     10s
    Click Element   ${botnav_btn_account}
    Wait Until Element Is Visible   ${account_btn_setting}  10s
    Click Element   ${account_btn_setting}
    Wait Until Element Is Visible   ${account_btn_registeredDevices}  10s
    Click Element   ${account_btn_registeredDevices}
    Wait Until Element Is Visible   ${account_btn_topRegisteredDevice}  10s
    Click Element   ${account_btn_topRegisteredDevice}
    Wait Until Element Is Visible   ${account_btn_acceptRemovalOfRegisteredDevice}  10s
    Click Element   ${account_btn_acceptRemovalOfRegisteredDevice}
    Enter OTP
    Login via Mobile number screen is displayed