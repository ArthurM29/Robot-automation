*** Settings ***
Library  Selenium2Library


*** Variables ***
${SIGN_IN_LINK}             css=.login
${SIGN_OUT_LINK}            css=.logout
${VIEW_MY_ACCOUNT_LINK}     css=.account



*** Keywords ***
Click 'Sign In' Link
    Wait Until Element Is Visible  ${SIGN_IN_LINK}
    Click Link  ${SIGN_IN_LINK}


Click 'Sign Out' Link
    Wait Until Element Is Visible  ${SIGN_OUT_LINK}
    Click Link  ${SIGN_OUT_LINK}


Go To 'My Account'
    Wait Until Element Is Visible  ${VIEW_MY_ACCOUNT_LINK}
    Click Link  ${VIEW_MY_ACCOUNT_LINK}







