*** Settings ***
Library  Selenium2Library



*** Variables ***
${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}          xpath=//div[@id='center_column']/form/p/button//i



*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}


