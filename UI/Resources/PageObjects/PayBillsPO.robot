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
${btn_pay_bills}        id=com.diskartech.mobile.debug:id/billsButton
${lbl_biller_list}      id=com.diskartech.mobile.debug:id/titleLabel
# ${btn_cat_credit_card}  xpath=//android.widget.TextView[@text='Credit Cards']//preceding::android.widget.FrameLayout[1]
# ${btn_cat_water}        xpath=//android.widget.TextView[@text='Water']//preceding::android.widget.FrameLayout[1]
${lbl_select_biller}    xpath=//android.widget.TextView[@text='Pumili ng biller']
${txt_searchBiller}      xpath=//android.widget.EditText[@text='Search Biller']
# ${btn_biller_bpi}    xpath=//android.widget.TextView[@text='BPI']
# ${btn_biller_maynilad}  xpath=//android.widget.TextView[@text='Maynilad Water']
${lbl_biller_name}      id=com.diskartech.mobile.debug:id/billerNameLabel
${txt_account_number}   xpath=//android.widget.EditText[@text='Account Number']
${txt_account_name}     xpath=//android.widget.EditText[@text='Consumer Name']
${txt_amount}           xpath=//android.widget.EditText[@text='Amount']
${btn_susunod}          xpath=//android.widget.Button[@text='Susunod']
${lbl_account_no}       xpath=//android.widget.TextView[@text='Account Number']//following::android.widget.TextView[1]
${lbl_account_name}     xpath=//android.widget.TextView[@text='Consumer Name']//following::android.widget.TextView[1]
${lbl_bill_amount}      id=com.diskartech.mobile.debug:id/billsAmountTextLabel
${lbl_service_fee}      id=com.diskartech.mobile.debug:id/serviceFeeTextLabel
${lbl_bill_total_amt}   id=com.diskartech.mobile.debug:id/totalAmountTextLabel

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Pay Bills is Displayed
    Wait Until Element Is Visible   ${btn_pay_bills}    5s

I clicked Pay Bills
    Click Element   ${btn_pay_bills}

Category List is Displayed
    Wait Until Element Is Visible   ${lbl_biller_list}    10s
    Take Screenshot  pay-bills_category-list.png

I clicked Category
    [Arguments]     ${category}
    Click Element   //android.widget.TextView[@text='${category}']//preceding::android.widget.FrameLayout[1]

Biller List is Displayed
    Wait Until Element Is Visible   ${lbl_select_biller}    10s
    Take Screenshot  pay-bills_biller-list.png

Entered Biller Name
    [Arguments]     ${biller}
    Click Element   ${txt_searchBiller}
    Wait Until Element Is Visible   ${txt_searchBiller}  10s
    Input Text  ${txt_searchBiller}  ${biller}
    Wait Until Element Is Visible   //android.widget.TextView[@text='${biller}']  10s
    Click Element   //android.widget.TextView[@text='${biller}']

Biller is Displayed
    Wait Until Element Is Visible   ${lbl_biller_name}    10s
    Take Screenshot  pay-bills_biller-details.png

I entered Bill details
    Input Text      ${txt_account_number}     ${billAccountNumber}
    # ${getBillerName} =  Get Text    ${lbl_biller_name}
    # Run Keyword If  '${getBillerName}'=='BPI'       Input Text      ${txt_account_name}       ${billAccountName}
    Input Text      ${txt_amount}             ${amount}

Pay Bills Confirmation is Displayed
    Wait Until Element Is Visible   ${lbl_confirm_popup}    15s
    Element Text Should Be  ${lbl_account_no}   ${billAccountNumber}
    # Run Keyword If  '${lbl_biller_name}'=='BPI'     Element Text Should Be  ${lbl_account_name}   ${billAccountName}
    Element Text Should Be  ${lbl_bill_amount}      PHP ${amount}.00
# calculate total amount=amount+service fee
    ${getServiceFee} =  Get Text    ${lbl_service_fee}
    ${serviceFee} =	Get Substring	${getServiceFee}	4
    ${calculatedTotalAmount} =    Evaluate    ${amount}+${serviceFee}
    ${intTotalAmount} =    Convert To Integer  ${calculatedTotalAmount}
    Element Text Should Be  ${lbl_bill_total_amt}      PHP ${intTotalAmount}.00
    Take Screenshot  pay-bills_confirmation.png    

Pay Bills Transaction Successful is Displayed
    Wait Until Element Is Visible   ${txt_title}    10s
    Wait Until Element Is Visible   ${txt_transaction_id}   10s
    Take Screenshot  pay-bills-transaction-success.png