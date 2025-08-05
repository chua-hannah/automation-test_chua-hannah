*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary 
Resource    ../Common.robot
Variables   ../Assets/testdata.py

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page

${transfer_lbl_Title}      xpath=//android.widget.TextView[@text='Transfer']
${transfer_lbl_transferToDT}    xpath=//android.widget.TextView[@text='Sa ibang DiskarTech account']
${transfer_lbl_transferToRCBC}  xpath=//android.widget.TextView[@text='Sa isang RCBC account']
${transfer_lbl_transferToOtherBank}     xpath=//android.widget.TextView[@text='Sa iba pang bangko o mobile wallet']
${transfer_lbl_recipient}   id=com.diskartech.mobile.debug:id/numberTextLabel
${transfer_lbl_accountNo}   id=com.diskartech.mobile.debug:id/productNameTextLabel
${transfer_lbl_amount}      id=com.diskartech.mobile.debug:id/detailsTextLabel
${transfer_lbl_popup}   xpath=//android.widget.TextView[@text='I-confirm ang details']
${transfer_lbl_pnb}     id=com.diskartech.mobile.debug:id/documentTypeName


${transfer_txt_dtAccountNo}   xpath=//android.widget.EditText[@text='Account Number / Mobile']
${transfer_txt_name}        xpath=//android.widget.EditText[@text='Name / Pangalan']
${transfer_txt_amount}      xpath=//android.widget.EditText[@text='Amount']
${transfer_txt_accountNo}   xpath=//android.widget.EditText[@text='Account number']
${transfer_txt_bankList}    xpath=//android.widget.EditText[@text='Select Bank or Mobile Wallet']
${transfer_txt_searchBank}      xpath=//android.widget.EditText[@text='Search']

${transfer_btn_susunod}     id=com.diskartech.mobile.debug:id/containedButton
${transfer_btn_confirm}     id=com.diskartech.mobile.debug:id/confirmButton
${transfer_btn_goHome}      id=com.diskartech.mobile.debug:id/goHomeButton


*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Transfer screen should be displayed
    Wait Until Element Is Visible      ${transfer_lbl_Title}   10s
    Element Text Should Be  ${transfer_lbl_Title}   Mag-transfer

I clicked "Sa ibang DiskarTech account"
    Wait Until Element Is Visible   ${transfer_lbl_transferToDT}
    Element Text Should Be      ${transfer_lbl_transferToDT}    Sa ibang DiskarTech account
    Click Element   ${transfer_lbl_transferToDT}

I clicked "Sa isang RCBC account"
    Wait Until Element Is Visible   ${transfer_lbl_transferToRCBC}  10s
    Element Text Should Be      ${transfer_lbl_transferToRCBC}  Sa isang RCBC account
    Click Element   ${transfer_lbl_transferToRCBC}

I clicked "Sa iba pang bangko o mobile wallet"
    Wait Until Element Is Visible   ${transfer_lbl_transferToOtherBank}     10s
    Element Text Should Be      ${transfer_lbl_transferToOtherBank}     Sa iba pang bangko o mobile wallet
    Click Element   ${transfer_lbl_transferToOtherBank}

Entered account number
    [Arguments]     ${typeOfTransfer}
    Run Keyword If  '${typeOfTransfer}'=='DT'       Input Text      ${transfer_txt_dtAccountNo}     ${dtAccountNo}
    ...     ELSE IF     '${typeOfTransfer}'=='RCBC'         Input Text      ${transfer_txt_accountNo}       ${rcbcAccountNo}
    ...     ELSE IF     '${typeOfTransfer}'=='otherBank'        Input Text      ${transfer_txt_accountNo}       ${otherBankAccountNo}

Entered bank name
    # Input Text  ${transfer_txt_bankList}    ${bank}
    Click Element   ${transfer_txt_bankList}
    Wait Until Element Is Visible   ${transfer_txt_searchBank}  10s
    Input Text  ${transfer_txt_searchBank}  ${bank}
    Wait Until Element Is Visible   ${transfer_lbl_pnb}     10s
    Click Element   ${transfer_lbl_pnb}

Entered name
    Input Text  ${transfer_txt_name}    ${recipientName}

Entered amount
    Input Text  ${transfer_txt_amount}      ${amount}

Clicked susunod na button
    Click Element   ${transfer_btn_susunod}

Confirmation popup is displayed  
    [Arguments]     ${typeOfTransfer}
    Wait Until Element Is Visible   ${transfer_lbl_popup}
    Element Text Should Be  ${transfer_lbl_popup}   I-confirm ang details
    Element Text Should Be  ${transfer_lbl_recipient}   ${recipientName}
    Element Text Should Be  ${transfer_lbl_amount}      PHP ${amount}.00
    Run Keyword If  '${typeOfTransfer}'=='DT'   Element Text Should Be      ${transfer_lbl_accountNo}       ${dtAccountNo}
    ...     ELSE IF     '${typeOfTransfer}'=='RCBC'     Element Text Should Be      ${transfer_lbl_accountNo}       ${rcbcAccountNo}
    ...     ELSE IF     '${typeOfTransfer}'=='otherBank'    Element Text Should Be      ${transfer_lbl_accountNo}       ${otherBankAccountNo}

Clicked confirm button
    Click Element   ${transfer_btn_confirm}

Successful Transfer screen is displayed
    Wait Until Element Is Visible   ${transfer_lbl_Title}   30s
    Element Text Should Be  ${transfer_lbl_Title}   Yun oh! Successful Transfer

Go back to Dashboard from Transfer screen
    Click Element   ${transfer_btn_goHome}