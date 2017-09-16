*** Settings ***
Library  Selenium2Library



*** Variables ***
${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}          xpath=//div[@id='center_column']/form/p/button



*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Enabled  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}


