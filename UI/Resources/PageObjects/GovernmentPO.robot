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
${btn_pay_government}   	com.diskartech.mobile.debug:id/governmentButton
${lbl_government_list}      id=com.diskartech.mobile.debug:id/titleLabel
${lbl_select_biller}    xpath=//android.widget.TextView[@text='Pumili ng biller']
${txt_searchBiller}      xpath=//android.widget.EditText[@text='Search Biller']
${txt_search}           xpath=//android.widget.EditText[@text='Search']
${lbl_biller_name}      id=com.diskartech.mobile.debug:id/billerNameLabel
${txt_ticket_number}   xpath=//android.widget.EditText[@text='Ticket Number']
${txt_govtAccountName}     xpath=//android.widget.EditText[@text='Name']
${txt_violation}        xpath=//android.widget.EditText[@text='Violation']
${btn_violation}        xpath=//android.widget.TextView[@text='Traffic']
${txt_violationCode}    xpath=//android.widget.EditText[@text='Violation Code']
${btn_violationCode}    xpath=//android.widget.TextView[@text='114']
${txt_clearance_Fee}    xpath=//android.widget.EditText[@text='Clearance Fee']
${btn_clearance_Fee}    xpath=//android.widget.TextView[@text='No Clearance Fee']
${txt_amount}           xpath=//android.widget.EditText[@text='Amount']
${btn_susunod}          xpath=//android.widget.Button[@text='Susunod']
${lbl_confirmTicketNo}       xpath=//android.widget.TextView[@text='Ticket Number']//following::android.widget.TextView[1]
${lbl_confirmViolation}     xpath=//android.widget.TextView[@text='Violation']//following::android.widget.TextView[1]
${lbl_confirmViolationCode}     xpath=//android.widget.TextView[@text='Violation Code']//following::android.widget.TextView[1]
${lbl_confirmGovtName}     xpath=//android.widget.TextView[@text='Name']//following::android.widget.TextView[1]
${lbl_confirmClearanceFee}     xpath=//android.widget.TextView[@text='Clearance Fee']//following::android.widget.TextView[1]
${lbl_confirmGovtAmount}      id=com.diskartech.mobile.debug:id/billsAmountTextLabel
${lbl_service_fee}      id=com.diskartech.mobile.debug:id/serviceFeeTextLabel
${lbl_bill_total_amt}   id=com.diskartech.mobile.debug:id/totalAmountTextLabel

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Government is Displayed
    Wait Until Element Is Visible   ${btn_pay_government}    5s

I clicked Government
    Click Element   ${btn_pay_government}

Government Biller List is Displayed
    Wait Until Element Is Visible   ${lbl_select_biller}    10s
    Take Screenshot  govt_biller-list.png

Entered Government Biller Name
    [Arguments]     ${govtBiller}
    Click Element   ${txt_searchBiller}
    Input Text      ${txt_searchBiller}  ${govtBiller}
    Wait Until Element Is Visible   //android.widget.TextView[@text='${govtBiller}']    10s
    Click Element   //android.widget.TextView[@text='${govtBiller}']

Government Biller is Displayed
    Wait Until Element Is Visible   ${lbl_biller_name}    10s
    Take Screenshot  govt_biller-details.png

I entered Government Bill Details
#for MMDA config
    Input Text      ${txt_ticket_number}     ${govtBillerNumber}
    Click Element   ${txt_violation}
    Wait Until Element Is Visible   ${vg_bottomPicker}  10s
    Click Element   ${btn_violation}
    Wait Until Element Is Visible   ${txt_violationCode}  10s
    Click Element   ${txt_violationCode}
    Wait Until Element Is Visible   ${txt_search}  10s
    Input Text  ${txt_search}  ${violationCode}
    Click Element   ${btn_violationCode}
    Wait Until Element Is Visible   ${txt_govtAccountName}  10s
    Input Text  ${txt_govtAccountName}     ${govtAccountName}
    Click Element   ${txt_clearance_Fee}
    Wait Until Element Is Visible   ${vg_bottomPicker}  10s
    Click Element   ${btn_clearance_Fee}
    Wait Until Element Is Visible   ${txt_amount}  10s
    Input Text      ${txt_amount}             ${govtAmountFee}

Pay Government Confirmation is Displayed
    Wait Until Element Is Visible   ${lbl_confirm_popup}    10s
    Element Text Should Be  ${lbl_confirmTicketNo}   ${govtBillerNumber}
    Element Text Should Be  ${lbl_confirmViolation}   ${violation}
    Element Text Should Be  ${lbl_confirmViolationCode}   ${violationCode}
    Element Text Should Be  ${lbl_confirmGovtName}   ${govtAccountName}
    Element Text Should Be  ${lbl_confirmClearanceFee}   ${clearanceFee}
    Element Text Should Be  ${lbl_bill_amount}      PHP ${govtAmountFee}.00
# calculate total amount=amount+service fee
    ${getServiceFee} =  Get Text    ${lbl_service_fee}
    ${serviceFee} =	Get Substring	${getServiceFee}	4
    ${calculatedTotalAmount} =    Evaluate    ${govtAmountFee}+${serviceFee}
    ${intTotalAmount} =    Convert To Integer  ${calculatedTotalAmount}
    Element Text Should Be  ${lbl_bill_total_amt}      PHP ${intTotalAmount}.00
    Take Screenshot  govt_confirmation.png    

Pay Government Transaction Successful is Displayed
    Wait Until Element Is Visible   ${txt_title}    10s
    Element Text Should Be  ${txt_title}   Yun oh! Payment Successful
    Take Screenshot  govt-transaction-success.png