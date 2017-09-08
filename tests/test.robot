*** Settings ***
Library  Selenium2Library


# robot -d results tests/sign_in.robot

*** Variables ***
${ELEMENT}          xpath=//a[contains(@class,'best')]


*** Test Cases ***
Test locators
    Open Browser  http://automationpractice.com/index.php  Firefox
    Maximize Browser Window
    Wait Until Element Is Visible  ${ELEMENT}
    Click Link  ${ELEMENT}
    sleep  2
    Close Browser