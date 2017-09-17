*** Settings ***
Library  Selenium2Library
Resource  ../SignIn.robot
Resource  ../SignIn.robot



*** Variables ***
${PAGE_HEADING}         css=.page-heading



*** Keywords ***
Page Heading Should Be
    Wait Until Element Is Visible  ${PAGE_HEADING}
    Element Text Should Be  ${PAGE_HEADING}  AUTHENTICATION


Sign In and Navigate To 'Checkout Address'
    [Arguments]  ${email}  ${password}
    SignIn.Enter Email  ${email}
    SignIn.Enter Password  ${password}
    SignIn.Submit Credentials

