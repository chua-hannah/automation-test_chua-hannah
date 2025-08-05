*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary 
Resource    ../Common.robot
Variables   ../Assets/testdata.py

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page
# Scalar Variables

${deposit_lbl_Title}    id=com.diskartech.mobile.debug:id/titleLabel
${deposit_lbl_partnerMerchant}  xpath=//android.widget.TextView[@text='Partner Merchants']
${deposit_lbl_eWallet}  xpath=//android.widget.TextView[@text='E-wallets na may InstaPay']
${deposit_lbl_onlineBank}       xpath=//android.widget.TextView[@text='Online Banking na may InstaPay']
${deposit_lbl_merchantName}     xpath=//android.widget.TextView[@text='${partnerMerchant}']
${deposit_lbl_Header}       xpath=//android.widget.TextView[@text='Paano mag-deposit sa ${partnerMerchant}?']
${deposit_lbl_instapayHeader}       id=com.diskartech.mobile.debug:id/headerLabel
${deposit_lbl_reference}    id=com.diskartech.mobile.debug:id/referenceLabel

${deposit_btn_deposit}      id=com.diskartech.mobile.debug:id/nextButton
${deposit_btn_susunod}      id=com.diskartech.mobile.debug:id/submitButton
${deposit_btn_close}        id=com.diskartech.mobile.debug:id/closeButton
${deposit_btn_taposNa}      id=android:id/button1
${deposit_btn_hindiPa}      id=android:id/button3
${deposit_btn_back}         id=com.diskartech.mobile.debug:id/backButton

${deposit_txt_depositAmount}    xpath=//android.widget.EditText[@text='Amount']

#Instructions Elements
${deposit_lbl_instruction1}     xpath=//android.widget.TextView[@text='Pumunta sa malapit na branch']
${deposit_lbl_description1}     xpath=//android.widget.TextView[@text='Pumunta sa malapit na branch ng napiling partner at sabihing magka-cash in sa DiskarTech account mo.']
${deposit_lbl_instruction2}     xpath=//android.widget.TextView[@text='I-enter ang amount']
${deposit_lbl_description2}     xpath=//android.widget.TextView[@text='I-enter ang amount na gustong i-deposit at pindutin ang “Susunod”.']
${deposit_lbl_instruction3}     xpath=//android.widget.TextView[@text='Generate at ipakita ang barcode']
${deposit_lbl_description3}     xpath=//android.widget.TextView[@text='Hintaying lumabas ang barcode. Ipakita ang barcode sa cashier at ibigay ang perang ide-deposit.']
${deposit_lbl_instruction4}     xpath=//android.widget.TextView[@text='Confirmation']
${deposit_lbl_description4}     xpath=//android.widget.TextView[@text='Hintayin ang confirmation na na-process na ang iyong deposit.']

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Deposit screen should be displayed
    Wait Until Element Is Visible      ${transfer_lbl_Title}   10s
    Element Text Should Be  ${transfer_lbl_Title}   Mag-deposit

I selected cash-in method
    [Arguments]     ${cashInMethod}
    Run Keyword If      '${cashInMethod}'=='Partner Merchant'       Click cash-in method    ${deposit_lbl_partnerMerchant}      Partner Merchants
    ...     ELSE IF     '${cashInMethod}'=='E-wallet'               Click cash-in method    ${deposit_lbl_eWallet}      E-wallets na may InstaPay
    ...     ELSE IF     '${cashInMethod}'=='Online Banking'         Click cash-in method    ${deposit_lbl_onlineBank}       Online Banking na may InstaPay

Click cash-in method
    [Arguments]     ${element}     ${elementText}
    Wait Until Element Is Visible   ${element}  10s
    Element Text Should Be      ${element}  ${elementText}
    Click Element   ${element}

Selected partner merchant
    Wait Until Element Is Visible   ${deposit_lbl_merchantName}     10s
    Element Text Should Be  ${deposit_lbl_merchantName}  ${partnerMerchant}
    Click Element   ${deposit_lbl_merchantName}

Selected cash-in na may InstaPay
    [Arguments]     ${instapayType}
    Run Keyword If      '${instapayType}'=='Online Banking'         Click cash-in method    //android.widget.TextView[@text='${onlineBank}']      ${onlineBank}
    ...     ELSE IF     '${instapayType}'=='E-wallet'               Click cash-in method    //android.widget.TextView[@text='${eWallet}']      ${eWallet}

Instruction for partner merchant is displayed
    Wait Until Element Is Visible   ${deposit_lbl_merchantName}     10s 
    Element Text Should Be  ${deposit_lbl_Header}   Paano mag-deposit sa ${partnerMerchant}?
    Element Text Should Be  ${deposit_lbl_instruction1}     Pumunta sa malapit na branch
    Element Text Should Be  ${deposit_lbl_description1}     Pumunta sa malapit na branch ng napiling partner at sabihing magka-cash in sa DiskarTech account mo.
    Element Text Should Be  ${deposit_lbl_instruction2}     I-enter ang amount
    Element Text Should Be  ${deposit_lbl_description2}     I-enter ang amount na gustong i-deposit at pindutin ang “Susunod”.
    Element Text Should Be  ${deposit_lbl_instruction3}     Generate at ipakita ang barcode
    Element Text Should Be  ${deposit_lbl_description3}     Hintaying lumabas ang barcode. Ipakita ang barcode sa cashier at ibigay ang perang ide-deposit.
    Element Text Should Be  ${deposit_lbl_instruction4}     Confirmation
    Element Text Should Be  ${deposit_lbl_description4}     Hintayin ang confirmation na na-process na ang iyong deposit.

Instruction for cash-in na may Instapay is displayed
    [Arguments]     ${instapayType}
    Wait Until Element Is Visible      ${deposit_lbl_instapayHeader}       10s
    Run Keyword If      '${instapayType}'=='Online Banking'         Element Text Should Be      ${deposit_lbl_instapayHeader}       Paano mag-deposit sa ${onlineBank}?
    ...     ELSE IF     '${instapayType}'=='E-wallet'               Element Text Should Be      ${deposit_lbl_instapayHeader}       Paano mag-deposit sa ${eWallet}?

Clicked Mag-deposit na button
    Click Element   ${deposit_btn_deposit}

Entered deposit amount  
    Wait Until Element Is Visible   ${deposit_txt_depositAmount}     10s
    Input Text  ${deposit_txt_depositAmount}    ${depositAmount}

Clicked susunod button
    Click Element   ${deposit_btn_susunod}

Reference Number is displayed
    Wait Until Element Is Visible   ${deposit_lbl_reference}    10s
    Element Text Should Be  ${deposit_lbl_reference}    Reference Number

I am done using the reference number
    Click Element   ${deposit_btn_close}
    Wait Until Element Is Visible   ${deposit_btn_taposNa}  10s
    Click Element   ${deposit_btn_taposNa}

Go back to Dashboard from Deposit screen
    Click Element   ${deposit_btn_back}
    Click Element   ${deposit_btn_back}
    Click Element   ${deposit_btn_back}
