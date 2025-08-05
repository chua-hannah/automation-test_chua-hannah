*** Settings ***
# List of libraries and resources to be used within the whole project
# This includes all files from the PageObjects folder
Library     Assets/mark-test-status.py
Library     String
Library     AppiumLibrary
Variables   Assets/config.py
Variables   Assets/testdata.py

*** Variables ***
# List of system variables to be used to open the app
# Includes desired capabilities for appium

# LOCAL
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    android
${PLATFORM_VERSION}     15
${DEVICE_NAME}      R5CWB29QC3Z
${NO_RESET}         false
${PACKAGE_NAME}        com.example.automation_test_app
${ACTIVITY_NAME}     com.example.automation_test_app.MainActivity

*** Keywords ***
Setup Test Environment
    [Documentation]     Generic local test setup
    Run Keyword If  '${environmentToRunTest}'=='LOCAL'      testSetupLocal
    ...     ELSE IF     '${environmentToRunTest}'=='BROWSERSTACK'   testSetupBrowserStack
    ...     ELSE    Log     Setup Test Environment went wrong. Please check the value of the variable 'environmentToRunTest'.

End result
    # List of global keywords
    Close Application

testSetupLocal
    Open Application    ${REMOTE_URL}
    ...   platformName=${PLATFORM_NAME}
    ...   platformVersion=${platformVersion}
    ...   deviceName=${deviceName}
    ...   automationName=UiAutomator2
    ...   newCommandTimeout=2500
    ...   appActivity=${ACTIVITY_NAME}
    ...   appPackage=${PACKAGE_NAME}
    ...   noReset=${NO_RESET}

Take Screenshot
    [Arguments]     ${filename}
    Capture Page Screenshot      ${filename}

Mark Test Status
    [Arguments]     ${status}       ${reason}
    Log    ${reason}    console=True