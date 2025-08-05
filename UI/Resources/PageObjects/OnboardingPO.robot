*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary 
Resource    ../Common.robot

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page
#Test Data
${username}     automation9 
${mobile}     9170000010 
${firstName}    Automation
${lastName}    Testing
${middleName}    Diskartech
${dateOfBirth}      01/18/1995
${gender}   ${onboarding_rdo_Male}
${placeOfBirth}     ABORLAN
${emailAddress}     ${username}@mail.com

# UI Assets
${onboarding_btn_tncSusunod}   id=com.diskartech.mobile.debug:id/bottomSheetNextButton
${onboarding_btn_dnpSusunod}  id=com.diskartech.mobile.debug:id/nextButton
${onboarding_btn_submit}     id=com.diskartech.mobile.debug:id/submitButton
${onboarding_btn_refSkip}   id=com.diskartech.mobile.debug:id/skipButton

${onboarding_txt_username}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_mobile}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_firstName}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_middleName}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_lastName}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_dateOfBirth}   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_placeOfBirth}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText
${onboarding_txt_email}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText

${onboarding_lbl_reminderHeader}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView[1]
${onboarding_lbl_formHeader}     id=com.diskartech.mobile.debug:id/headerLabel

${onboarding_rdo_beneficiaryHindi}  id=com.diskartech.mobile.debug:id/regularButton
${onboarding_rdo_beneficiaryOo}  id=com.diskartech.mobile.debug:id/brnButton
${onboarding_rdo_Female}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.RadioButton[1]
${onboarding_rdo_Male}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.RadioButton[2]

*** Keywords ***
Click Susunod
    Click Element   ${onboarding_btn_dnpSusunod}

I accepts Terms and Condition
    Swipe    351    1342    358    278
    Wait Until Element Is Visible   ${onboarding_btn_tncSusunod}   10s
    Click Element   ${onboarding_btn_tncSusunod}

I accepts Data and Personalization
    Wait Until Element Is Visible   ${onboarding_btn_dnpSusunod}    10s
    Click Susunod

I entered username
    Wait Until Element Is Visible   ${onboarding_txt_username}  10s
    Log     ${username}
    Input Text  ${onboarding_txt_username}  ${username}
    Click Element   ${onboarding_btn_submit}

I skipped referral code
    Wait Until Element Is Visible   ${onboarding_btn_refSkip}   10s
    Click Element   ${onboarding_btn_refSkip}

I entered mobile
    Wait Until Element Is Visible   ${onboarding_txt_mobile}
    Log    ${mobile}
    Input Text  ${onboarding_txt_mobile}    ${mobile}
    Click Element   ${onboarding_btn_submit}

Reminders screen is displayed
    Wait Until Element Is Visible   ${onboarding_lbl_reminderHeader}    10s
    Click Susunod

Selected Hindi in Beneficiary screen 
    Wait Until Element Is Visible   ${onboarding_rdo_beneficiaryHindi}  10s
    Click Element   ${onboarding_rdo_beneficiaryHindi}
    Click Susunod

Eligibility screen is displayed
    Wait Until Element Is Visible   ${onboarding_lbl_formHeader}     10s
    Element Text Should Be      ${onboarding_lbl_formHeader}     Eligibility
    Click Susunod

I skipped Program Beneficiary screen
    Wait Until Element Is Visible   ${onboarding_lbl_formHeader}  10s
    Element Text Should Be     ${onboarding_lbl_formHeader}      Member/Program Beneficiary    
    Click Susunod

I populated required fields in Personal Details
    Wait Until Element Is Visible   ${onboarding_lbl_formHeader}    10s
    Element Text Should Be  ${onboarding_lbl_formHeader}    Personal Details
    Input Text  ${onboarding_txt_firstName}     ${firstName}
    Input Text  ${onboarding_txt_middleName}    ${middleName}
    Input Text  ${onboarding_txt_lastName}      ${lastName}
    Scroll  ${onboarding_txt_firstName}     ${onboarding_rdo_Female}
    #Swipe    485    1292    483    419
    Click Element   ${gender}
    # Scroll Element Into View    ${onboarding_txt_email}
    # Run Keyword And Ignore Error    Scroll Element Into View    ${onboarding_txt_email}
    Wait Until Element Is Visible   ${onboarding_txt_email}     10s
    Input Text  ${onboarding_txt_dateOfBirth}   ${dateOfBirth}
    Input Text  ${onboarding_txt_placeOfBirth}  ${placeOfBirth}
    Input Text  ${onboarding_txt_email}     ${emailAddress}
    Click Susunod




