*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     AppiumLibrary 
Resource    ../Common.robot

*** Variables ***
# List of variables to be used within the page
# Includes locator paths of every element within the page

${dashboard_btn_transfer}   id=com.diskartech.mobile.debug:id/transferButton
${dashboard_btn_deposit}    id=com.diskartech.mobile.debug:id/depositButton
${dashboard_btn_withdraw}   id=com.diskartech.mobile.debug:id/withdrawButton
 

*** Keywords ***
### GIVEN ###
### WHEN ###
### THEN ###

Icon is displayed
    [Arguments]     ${icon}
    Run Keyword If  '${icon}'=='Transfer'       Wait Until Element Is Visible       ${dashboard_btn_transfer}   10s
    ...  ELSE IF    '${icon}'=='Withdrawal'     Wait Until Element Is Visible       ${dashboard_btn_withdraw}   10s
    ...  ELSE IF    '${icon}'=='Deposit'        Wait Until Element Is Visible       ${dashboard_btn_deposit}   10s

I clicked the icon  
    [Arguments]     ${icon}
    Run Keyword If  '${icon}'=='Transfer'       Click Element       ${dashboard_btn_transfer}
    ...  ELSE IF    '${icon}'=='Withdrawal'     Click Element       ${dashboard_btn_withdraw}
    ...  ELSE IF    '${icon}'=='Deposit'        Click Element       ${dashboard_btn_deposit}