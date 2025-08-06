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
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM_NAME}    android
# Replace with your device name
${DEVICE_NAME}      emulator-5554
# Replace with your platform version
${PLATFORM_VERSION}     15.0
${NO_RESET}         false
${PACKAGE_NAME}        com.example.automation_test_app
${ACTIVITY_NAME}     com.example.automation_test_app.MainActivity

*** Keywords ***
Setup Test Environment
    [Documentation]     Generic local test setup (local only)
    testSetupLocal

End result
    # List of global keywords
    Close Application

testSetupLocal
    Open Application    ${REMOTE_URL}
    ...   platformName=${PLATFORM_NAME}
    ...   platformVersion=${platformVersion}
    ...   deviceName=${deviceName}
    ...   automationName=UiAutomator2
    ...   appActivity=${ACTIVITY_NAME}
    ...   appPackage=${PACKAGE_NAME}
    ...   noReset=${NO_RESET}

Take Screenshot
    [Arguments]     ${filename}
    Capture Page Screenshot      ${filename}