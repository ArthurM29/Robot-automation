*** Settings ***
Library  Selenium2Library
Library  String



*** Variables ***
${ORDERPAYMENT_PROCEED_TO_CHECKOUT_BUTTON}          xpath=//p[@id='cart_navigation']/button//i
${ORDER_CONFIRMATION_TEXT}                          xpath=//div[@id='center_column']/div/p/strong
${QUANTITY_LABEL}                                   css=.cart_quantity.text-center>span
${COLOUR_AND_SIZE_LABEL}                            css=.cart_description>small>a
${PAY_BY_BANK_WIRE_LINK}                            css=.bankwire
${PAY_BY_CHECK_LINK}                                css=.cheque
${SELECTED_PAYMENT_METHOD_LABEL}                    css=.page-subheading
${PRODUCT_PRICE}                                    css=span[id^='total_product_price']
${TOTAL_PRICE}                                      css=#total_price





*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ORDERPAYMENT_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERPAYMENT_PROCEED_TO_CHECKOUT_BUTTON}


Verify Confirmation Text Displayed
    Wait Until Element Is Visible  ${ORDER_CONFIRMATION_TEXT}
    Element Text Should Be  ${ORDER_CONFIRMATION_TEXT}  Your order on My Store is complete.


Product Quantity Should Be
    [Arguments]  ${quantity}
    Wait Until Element Is Visible  ${QUANTITY_LABEL}
    Element Text Should Be  ${QUANTITY_LABEL}  ${quantity}


Product Size Should Be
    [Arguments]  ${expected_size}
    ${actual_size} =  Get Product Size
    Should Be Equal As Strings  ${expected_size}  ${actual_size}


Get Product Size
    Wait Until Element Is Visible  ${COLOUR_AND_SIZE_LABEL}
    ${colour_and_size} =  Get Text  ${COLOUR_AND_SIZE_LABEL}
    ${label_and_size} =  Fetch From Right  ${colour_and_size}  ,
    ${size} =  Fetch From Right  ${label_and_size}  :
    ${size} =  Strip String  ${size}
    [Return]  ${size}


Get Product Colour
    Wait Until Element Is Visible  ${COLOUR_AND_SIZE_LABEL}
    ${colour_and_size} =  Get Text  ${COLOUR_AND_SIZE_LABEL}
    ${label_and_size} =  Fetch From Left  ${colour_and_size}  ,
    ${size} =  Fetch From Right  ${label_and_size}  :
    ${size} =  Strip String  ${size}
    [Return]  ${size}


Product Colour Should Be
    [Arguments]  ${expected_colour}
    ${actual_colour} =  Get Product Colour
    Should Be Equal As Strings  ${expected_colour}  ${actual_colour}


Click on 'Pay by bank wire' Payment Method
    Wait Until Element Is Visible  ${PAY_BY_BANK_WIRE_LINK}
    Click Element  ${PAY_BY_BANK_WIRE_LINK}


Click on 'Pay by check' Payment Method
    Wait Until Element Is Visible  ${PAY_BY_CHECK_LINK}
    Click Element  ${PAY_BY_CHECK_LINK}


Payment Method Should Be
    [Arguments]  ${expected_payment_method}
    Wait Until Element Is Visible  ${SELECTED_PAYMENT_METHOD_LABEL}
    ${actual_payment_method} =  Get Text  ${SELECTED_PAYMENT_METHOD_LABEL}
    Should Be Equal As Strings  ${expected_payment_method}  ${actual_payment_method}  ignore_case=True


Product Price Should Be
    [Arguments]  ${price}
    Wait Until Element Is Visible  ${PRODUCT_PRICE}
    Element Text Should Be  ${PRODUCT_PRICE}  ${price}


Total Price Should Be
    [Arguments]  ${price}
    Wait Until Element Is Visible  ${TOTAL_PRICE}
    Element Text Should Be  ${TOTAL_PRICE}  ${price}

