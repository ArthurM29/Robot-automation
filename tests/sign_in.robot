*** Settings ***
Resource            ../resources/keywords/signin_kw.robot
Resource            ../resources/common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# robot -d results tests/sign_in.robot

*** Test Cases ***
Email is required
    Sign In  ${EMPTY}  ${VALID_PASSWORD}
    Verify Email Required Message


Password is required
    Sign In  ${VALID_EMAIL}  ${EMPTY}
    Verify Password Required Message


Email and Password are required
    Sign In  ${EMPTY}  ${EMPTY}
    Verify Email Required Message


User is able to Sign In with valid credentials
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Verify Successful Sign In


User is not able to Sign In with invalid credentials
    [Template]  Invalid Sign In
    ${INVALID_EMAIL}  ${VALID_PASSWORD}
    ${VALID_EMAIL}    ${INVALID_PASSWORD}
    ${INVALID_EMAIL}  ${INVALID_PASSWORD}


Spaces are ignored before and after email
    Sign In  ${SPACE * 10}  ${VALID_PASSWORD}
    Verify Email Required Message


Error is displayed when Email is entered with invalid format
    Sign In  invalid_email  ${VALID_PASSWORD}
    Verify Invalid Email Format Message


User is able to Sign Out
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Sign Out
    Verify Successful Sign Out

