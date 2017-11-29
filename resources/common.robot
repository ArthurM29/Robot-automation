*** Settings ***
Library  Selenium2Library
Resource  keywords/signin_kw.robot

*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  Firefox


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Navigate To Home Page

End Web Test
    Close Browser