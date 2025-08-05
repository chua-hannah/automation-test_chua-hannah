*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary
Library     String
Resource    ../Common.robot
Variables   ../Assets/testdata.py

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page
# Scalar Variables
${btn_buy_load}         xpath=//android.widget.TextView[@text='Load']
${lbl_buy_load}         id=com.diskartech.mobile.debug:id/hintLabel
${lbl_number_amount_select}    xpath=//android.widget.TextView[@text='Buy Load']
${txt_mobile_number}    xpath=//android.widget.EditText[@text='Mobile Number']
# ${btn_load_amount}      xpath=//android.widget.TextView[@text='${loadAmount}']
${lbl_mobile_no}        xpath=//android.widget.TextView[@text='Mobile Number']//following::android.widget.TextView[1]
${lbl_input_mobileNo}   xpath=(//android.widget.EditText)[1]
${lbl_confirm_mobileNo}     id=com.diskartech.mobile.debug:id/numberTextLabel
${lbl_load_total_amt}   id=com.diskartech.mobile.debug:id/totalAmountTextLabel
${btn_confirm}          xpath=//android.widget.Button[@text='Confirm']


*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Buy Load is Displayed
    Wait Until Element Is Visible   ${btn_buy_load}    5s

I clicked Buy Load
    Click Element   ${btn_buy_load}

Network Selection is displayed
    Wait Until Element Is Visible   ${lbl_number_amount_select}    10s
    Take Screenshot  buy-load_network-selection.png

I clicked Network Selection
    Wait Until Element Is Visible   ${lbl_buy_load}    10s
    [Arguments]     ${selected_network}
    ${valid_networks}=    Create List    GLOBE    DITO TELECOM    CHERRY PREPAID    TM    SMART    TNT    SUN
    Run Keyword If    '${selected_network}' in @{valid_networks}    
    Click Element    //android.widget.TextView[@text='${selected_network}']
    
Input Mobile Number and Amount Selection are displayed
    Wait Until Element Is Visible   ${lbl_number_amount_select}    10s
    Take Screenshot  buy-load_number_amount-input.png

I entered Mobile Number
    # Generate Random Mobile Number
    ${mobile_number} =  Generate Random String  9  [NUMBERS]
    Input Text      ${txt_mobile_number}     9${mobile_number}
    # ${mobileNumber} =   Set Global Variable    ${txt_mobile_number}

I selected Amount
    [Arguments]     ${inputAmount}
    Click Element   //android.widget.TextView[@text='${inputAmount}']
    # ${loadAmount} =     Set Global Variable    ${inputAmount}

Buy Load Confirmation is Displayed
    Wait Until Element Is Visible   ${lbl_confirm_popup}    10s
    # Element Text Should Be  ${lbl_load_total_amt}      PHP ${loadAmount}.00
    # Element Text Should Be  ${lbl_confirm_mobileNo}      +63 9${mobileNumber}
    Take Screenshot  buy-load_confirmation.png

Buy Load Transaction Successful is Displayed
    Wait Until Element Is Visible   ${txt_title}    10s
    Wait Until Element Is Visible   ${txt_transaction_id}   10s
    Take Screenshot  buy-load_transaction-success.png