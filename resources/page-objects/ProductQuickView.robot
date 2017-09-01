*** Settings ***
Library  Selenium2Library
Library  Dialogs


*** Variables ***
${QUICK_VIEW_WINDOW}            css=.fancybox-iframe
${QUICK_VIEW_IMAGE}             css=#bigpic
${CLOSE_QUICK_VIEW_BUTTON}      xpath=//div[@class='fancybox-outer']/following-sibling::a



*** Keywords ***
Load the Frame
    Select Frame  ${QUICK_VIEW_WINDOW}
    Wait Until Element Is Visible  ${QUICK_VIEW_IMAGE}

Verify The Frame is Loaded
    Element Should Be Visible  ${QUICK_VIEW_IMAGE}

Unload the Frame
    Unselect Frame

Verify The Frame is Closed
    Element Should Not Be Visible  ${QUICK_VIEW_IMAGE}

Click 'Close' Button
    Wait Until Element Is Visible  ${CLOSE_QUICK_VIEW_BUTTON}
    Click Link  ${CLOSE_QUICK_VIEW_BUTTON}









