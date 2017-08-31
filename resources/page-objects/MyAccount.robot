*** Settings ***
Library  Selenium2Library


*** Variables ***
${SIGN_OUT_LINK}            css=.logout
${MYACCOUNT_PAGE_TITLE}     My account - My Store


*** Keywords ***
Verify Page Loaded
    Title Should Be  ${MYACCOUNT_PAGE_TITLE}

Click Sign Out Link
    Click Link  ${SIGN_OUT_LINK}