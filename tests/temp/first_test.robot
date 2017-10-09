*** Settings ***
Library  Selenium2Library

*** Test Cases ***
My First Test
    Open Browser  https://www.google.am/  Firefox
    sleep  2
    Input Text  id=lst-ib  Beatles
    sleep  2
    Click Button  name=btnI
    sleep  2
    Page Should Contain  Beatles
    Close Browser
    sleep  2