*** Settings ***
Resource            ../../Resources/sign_in_keywords.robot
Resource            ../../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# robot -d results Tests/Sign_in/authentication.robot

*** Test Cases ***
Sign In with Valid Credentials
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Verify Successful Sign In

Sign In with Invalid Credentials
    [Template]  Invalid Sign In
    ${INVALID_EMAIL}  ${VALID_PASSWORD}
    ${VALID_EMAIL}    ${INVALID_PASSWORD}
    ${INVALID_EMAIL}  ${INVALID_PASSWORD}

Able To Sign Out
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Sign Out
    Verify Successful Sign Out
