*** Settings ***
Resource            ../../Resources/sign_in_keywords.robot
Resource            ../../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# robot -d results Tests/Sign_in/validation.robot

*** Test Cases ***
Email is required
    Sign In  ${EMPTY}  ${VALID_PASSWORD}
    Verify Email Required Message

Password is required
    Sign In  ${VALID_EMAIL}  ${EMPTY}
    Verify Password Required Message

Email and password are required
    Sign In  ${EMPTY}  ${EMPTY}
    Verify Email Required Message

Spaces are trimmed in Email
    Sign In  ${SPACE * 10}  ${VALID_PASSWORD}
    Verify Email Required Message
