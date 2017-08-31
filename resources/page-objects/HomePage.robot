*** Settings ***
Library  Selenium2Library
Resource            ../../resources/common.robot


*** Variables ***
${SIGN_IN_LINK}        css=.login
${HOME_PAGE_TITLE}     My Store


*** Keywords ***
Load
    Go To  ${URL}

Verify Page Loaded
    Title Should Be  ${HOME_PAGE_TITLE}

Click Sign In Link
    Click Link  ${SIGN_IN_LINK}


