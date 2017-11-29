*** Settings ***
Library  Selenium2Library


*** Variables ***
${HOME_PAGE_TITLE}     My Store


*** Keywords ***
Load
    Go To  ${URL}


Verify Page Loaded
    Wait Until Element Is Visible  css=#editorial_block_center>h1
    Element Text Should Be  css=#editorial_block_center>h1  Automation Practice Website



