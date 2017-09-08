*** Settings ***
Library  Selenium2Library



*** Variables ***
${ORDERPAYMENT_PROCEED_TO_CHECKOUT_BUTTON}          xpath=//p[@id='cart_navigation']/button//i
${PAY_BY_BANK_WIRE_PAYMENT_METHOD}                  xpath=//div[@id='HOOK_PAYMENT']/div[1]//a
${PAY_BY_CHECK_PAYMENT_METHOD}                      xpath=//div[@id='HOOK_PAYMENT']/div[2]//a
${ORDER_CONFIRMATION_TEXT}                          xpath=//div[@id='center_column']/div/p/strong




*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERADDRESS_PROCEED_TO_CHECKOUT_BUTTON}


Click On 'Pay by bank wire' Payment Method
    Wait Until Element Is Visible  ${PAY_BY_BANK_WIRE_PAYMENT_METHOD}
    Click Link  ${PAY_BY_BANK_WIRE_PAYMENT_METHOD}


Click On 'Pay by check' Payment Method
    Wait Until Element Is Visible  ${PAY_BY_CHECK_PAYMENT_METHOD}
    Click Link  ${PAY_BY_CHECK_PAYMENT_METHOD}


Verify Confirmation Text Displayed
    Wait Until Element Is Visible  ${ORDER_CONFIRMATION_TEXT}
    Element Text Should Be  ${ORDER_CONFIRMATION_TEXT}  Your order on My Store is complete.

