*** Settings ***
Library  Selenium2Library

*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  Firefox

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser