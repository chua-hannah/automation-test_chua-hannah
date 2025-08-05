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
${btn_insurance}        id=com.diskartech.mobile.debug:id/insuranceButton
${lbl_title}    id=com.diskartech.mobile.debug:id/titleLabel
${lbl_availProducts}    xpath=//android.widget.LinearLayout[@content-desc="Available Products"]
${lbl_availedProducts}    xpath=//android.widget.LinearLayout[@content-desc="Availed Products"]
${btn_lifeInsurance}    id=com.diskartech.mobile.debug:id/lifeInsuranceButton
${btn_nonLifeInsurance}     id=com.diskartech.mobile.debug:id/nonLifeInsuranceButton
${lbl_biller_name}      id=com.diskartech.mobile.debug:id/billerNameLabel
${txt_civilStatus}      xpath=//android.widget.EditText[@text='Civil Status']
${btn_showList}         id=com.diskartech.mobile.debug:id/moreButton
${btn_buy_myself}       id=com.diskartech.mobile.debug:id/buttonBuyForSelf
${btn_buy_others}       id=com.diskartech.mobile.debug:id/buttonBuyForOthers
${txt_occupation}       xpath=//android.widget.EditText[@text='Occupation']
${txt_occupation_clerks}    xpath=//android.widget.TextView[@text='Clerks']
${txt_singleCivStat}    xpath=//android.widget.TextView[@text='Single']
${txt_benFullName}      xpath=//android.widget.EditText[@text='Full Name']
${txt_firstName}        xpath=//android.widget.EditText[@text='First Name']
${txt_middleName}       xpath=//android.widget.EditText[@text='Middle Name']
${txt_lastName}         xpath=//android.widget.EditText[@text='Last Name']
${txt_birthDate}        xpath=//android.widget.EditText[@text='Date of Birth']
${datePicker}           id=com.diskartech.mobile.debug:id/datePicker
${btn_birthDate}        id=com.diskartech.mobile.debug:id/birthDateInput
${btn_bottomOk}         id=com.diskartech.mobile.debug:id/okButton
${txt_gender}           xpath=//android.widget.EditText[@text='Gender / Kasarian']
${txt_male}             xpath=//android.widget.TextView[@text='Male']
${txt_relation}         xpath=//android.widget.EditText[@text='Relasyon sa Beneficiary']
${txt_benRelation}         xpath=//android.widget.EditText[@text='Relasyon sa benepisyaryo']
${txt_relation_brother}     xpath=//android.widget.TextView[@text='Brother']
${txt_relation_magulang}    xpath=//android.widget.TextView[@text='Magulang']
${txt_amount}           xpath=//android.widget.EditText[@text='Amount']
${btn_monthlyPayment}   id=com.diskartech.mobile.debug:id/monthlyButton
${btn_yearlyPayment}    id=com.diskartech.mobile.debug:id/yearlyButton
${lbl_insuranceProdName}       	id=com.diskartech.mobile.debug:id/insuranceTextLabel
${lbl_insurancePeriod}     id=com.diskartech.mobile.debug:id/periodTextLabel
${lbl_insurancePremium}     id=com.diskartech.mobile.debug:id/premiumTextLabel
${lbl_bill_amount}      id=com.diskartech.mobile.debug:id/billsAmountTextLabel
${lbl_bill_total_amt}   id=com.diskartech.mobile.debug:id/totalAmountTextLabel

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Insurance is Displayed
    Wait Until Element Is Visible   ${btn_insurance}    5s

I clicked Insurance
    Click Element   ${btn_insurance}

Insurance Category List is Displayed
    Wait Until Element Is Visible   ${lbl_title}    5s
    Take Screenshot  insurance_category-list.png

I clicked Life Insurance
    Click Element   ${btn_lifeInsurance}

I clicked Non Life Insurance
    Click Element   ${btn_nonLifeInsurance}

List of Life Insurance Products is Displayed
    Wait Until Element Is Visible   ${lbl_availProducts}    10s
    Take Screenshot  insurance_life-product-list.png

List of Non Life Insurance Products is Displayed
    Wait Until Element Is Visible   ${lbl_availProducts}    10s
    Take Screenshot  insurance_nonlife-product-list.png

I clicked Life Insurance Product
    Click Element   xpath=//android.widget.TextView[@text='${lifeInsuranceProdName}']

I clicked Non Life Insurance Product
    Click Element   xpath=//android.widget.TextView[@text='${nonLifeInsuranceProdName}']

Life Insurance Product Details is Displayed
    Wait Until Element Is Visible   ${lbl_title}    10s
    Element Text Should Be  ${lbl_title}    ${lifeInsuranceProdName}
    Take Screenshot  insurance_life-product-details.png

Non Life Insurance Product Details is Displayed
    Wait Until Element Is Visible   ${lbl_title}    10s
    Element Text Should Be  ${lbl_title}    ${nonLifeInsuranceProdName}
    Take Screenshot  insurance_nonlife-product-details.png

I selected Beneficiary
    [Arguments]     ${beneficiary}
    Wait Until Element Is Visible   ${vg_bottom_sheet}     5s
    Run Keyword If      '${beneficiary}'=='Bumili para sa sarili'     Click Element       ${btn_buy_myself}
    ...     ELSE IF     '${beneficiary}'=='Bumili para sa iba'       Click Element         ${btn_buy_others}

I clicked Buy Button
    Click Element   ${btn_submit}

Health Declaration Page is Displayed
    Wait Until Element Is Visible   ${lbl_title}    5s
    Element Text Should Be  ${lbl_title}    Health Declaration Page
    Take Screenshot  insurance_health-declaration-page.png

I clicked Agree Button
    Click Element   ${btn_submit}

I entered Civil Status
    Wait Until Element Is Visible   ${lbl_title}     5s
    Click Element   ${txt_civilStatus}
    Wait Until Element Is Visible   ${vg_bottomPicker}     5s
    Click Element   ${btn_showList}
    Wait Until Element Is Visible   ${txt_singleCivStat}     5s
    Click Element   ${txt_singleCivStat}
    Wait Until Element Is Visible   ${lbl_title}     5s
    Click Element   ${btn_submit}
    Take Screenshot  insurance_life-information-page.png

Beneficiary Information Page is Displayed
    Wait Until Element Is Visible   ${lbl_title}    5s
    Take Screenshot  insurance_ben-information-page.png

I entered Beneficiary Details
    Input Text      ${txt_firstName}    ${firstName}
    Input Text      ${txt_middleName}    ${middleName}
    Input Text      ${txt_lastName}    ${lastName}
    Input Text      ${txt_birthDate}    ${birthDate}
    Click Element   ${btn_birthDate}
    Wait Until Element is Visible   ${datePicker}   5s
    Click Element   ${btn_bottomOk}
    Wait Until Element is Visible   ${txt_gender}     5s
    Swipe    485    1292    483    419
    Click Element   ${txt_gender}
    Wait Until Element Is Visible   ${vg_bottomPicker}     5s
    Click Element   ${txt_male}
    Wait Until Element is Visible   ${txt_relation}     5s
    Click Element   ${txt_relation}
    Wait Until Element Is Visible   ${vg_bottomPicker}     5s
    Click Element   ${btn_showList}
    Click Element   ${txt_relation_brother}
    Wait Until Element Is Visible   ${btn_submit}     5s

I entered Non Life Insurance Information Details
    Wait Until Element Is Visible   ${lbl_title}     5s
    Click Element   ${txt_occupation}
    Wait Until Element Is Visible   ${vg_bottomPicker}     5s
    Click Element   ${btn_viewMore}
    Wait Until Element Is Visible   ${txt_occupation_clerks}     5s
    Click Element   ${txt_occupation_clerks}
    Wait Until Element Is Visible   ${txt_benFullName}     5s
    Input Text   ${txt_benFullName}     ${fullName}
    Click Element   ${txt_benRelation}
    Wait Until Element Is Visible   ${vg_bottomPicker}     5s
    Click Element   ${btn_viewMore}
    Wait Until Element Is Visible   ${txt_relation_magulang}     5s
    Click Element   ${txt_relation_magulang}
    Wait Until Element Is Visible   ${btn_submit}     5s

Payment Subscription Page is Displayed
    Wait Until Element Is Visible   ${lbl_title}     5s
    Take Screenshot  insurance_payment.png

I selected Payment Subscription
    [Arguments]     ${paymentInterval}
    Run Keyword If      '${paymentInterval}'=='Monthly'     Click Element       ${btn_monthlyPayment}
    ...     ELSE IF     '${paymentInterval}'=='Yearly'       Click Element         ${btn_yearlyPayment}

Life Insurance Confirmation is Displayed
    [Arguments]     ${paymentInterval}
    Wait Until Element Is Visible   ${lbl_confirm_popup}    15s
    Element Text Should Be  ${lbl_insuranceProdName}   ${lifeInsuranceProdName}
    Element Text Should Be  ${lbl_insurancePeriod}   12 Months Coverage
    ${premiumMonthlyAmount} =    Evaluate    ${lifeInsurancePremiumAmount}/10
    ${intMonthlyAmount} =    Convert To Integer  ${premiumMonthlyAmount}
    Run Keyword If      '${paymentInterval}'=='Monthly'     Element Text Should Be  ${lbl_insurancePremium}   PHP ${intMonthlyAmount}.00 monthly
    ...     ELSE IF     '${paymentInterval}'=='Yearly'      Element Text Should Be  ${lbl_insurancePremium}   PHP ${lifeInsurancePremiumAmount}.00 yearly
    Run Keyword If      '${paymentInterval}'=='Monthly'     Element Text Should Be  ${lbl_bill_total_amt}      PHP ${intMonthlyAmount}.00
    ...     ELSE IF     '${paymentInterval}'=='Yearly'      Element Text Should Be  ${lbl_bill_total_amt}      PHP ${lifeInsurancePremiumAmount}.00
    Take Screenshot  insurance_life_confirmation.png

Non Life Insurance Confirmation is Displayed
    Wait Until Element Is Visible   ${lbl_confirm_popup}    15s
    Element Text Should Be  ${lbl_insuranceProdName}   ${nonLifeInsuranceProdName}
    Element Text Should Be  ${lbl_insurancePeriod}   12 Months Coverage
    # Element Text Should Be  ${lbl_insurancePremium}   PHP ${nonLifeInsurancePremiumAmount}.00
    Element Text Should Be  ${lbl_bill_total_amt}      PHP ${nonLifeInsurancePremiumAmount}.00
    Take Screenshot  insurance_nonlife_confirmation.png   

Life Insurance Transaction Successful is Displayed
    Wait Until Element Is Visible   ${txt_title}    10s
    Wait Until Element Is Visible   ${txt_transaction_id}   10s
    Take Screenshot  insurance_life-transaction-success.png

Non Life Insurance Transaction Successful is Displayed
    Wait Until Element Is Visible   ${txt_title}    10s
    Wait Until Element Is Visible   ${txt_transaction_id}   10s
    Take Screenshot  insurance_nonlife-transaction-success.png

Existing Insurance Prompt is Displayed
    Wait Until Element Is Visible   ${vg_bottom_sheet}     5s
    Element Text Should Be  ${lbl_title}    Oops! May existing Sun Life Grepa Insurance ka na.
    Take Screenshot  insurance_existing-error.png
    #and click back button

I cancelled Availed Insurance