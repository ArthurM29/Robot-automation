*** Settings ***
Library  Selenium2Library

*** Test Cases ***
My First Test
    Open Browser  https://www.google.am/  Firefox
    Input Text  id=lst-ib  Beatles
    Click Button  name=btnI
    Page Should Contain  Beatles
    Close Browser