*** Settings ***
Library  Selenium2Library


*** Variables ***
${HOME_PAGE_TITLE}     My Store


*** Keywords ***
Load
    Go To  ${URL}

Verify Page Loaded
    Title Should Be  ${HOME_PAGE_TITLE}



