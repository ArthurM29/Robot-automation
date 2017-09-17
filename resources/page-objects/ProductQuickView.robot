*** Settings ***
Library  Selenium2Library


*** Variables ***
${QUICK_VIEW_WINDOW}                        css=.fancybox-iframe
${QUICK_VIEW_IMAGE}                         css=#bigpic
${CLOSE_QUICK_VIEW_BUTTON}                  xpath=//div[@class='fancybox-outer']/following-sibling::a
${QUICK_VIEW_ADD_TO_CART_BUTTON}            xpath=//p[@id='add_to_cart']/button/span
${BUTTON_CONTAINER}                         css=.box-info-product



*** Keywords ***
Frame Should Be Loaded
    Select Frame  ${QUICK_VIEW_WINDOW}
    Wait Until Element Is Visible  ${QUICK_VIEW_IMAGE}
    Unselect Frame


Verify The Frame is Closed
    Wait Until Element Is Not Visible  ${QUICK_VIEW_IMAGE}
    Element Should Not Be Visible  ${QUICK_VIEW_IMAGE}
    Unselect Frame


Click 'Close' Button
    Wait Until Element Is Visible  ${CLOSE_QUICK_VIEW_BUTTON}
    Click Link  ${CLOSE_QUICK_VIEW_BUTTON}


Click 'Add to Cart' Button
    Wait Until Element Is Visible  ${QUICK_VIEW_WINDOW}
    Select Frame  ${QUICK_VIEW_WINDOW}
    Click Element  ${QUICK_VIEW_ADD_TO_CART_BUTTON}
    Unselect Frame




