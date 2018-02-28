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
${UNIT_PRICE_LABEL}                                 xpath=//a[text()='{product_name}']/ancestor::tr//span[starts-with(@id,'product_price')]/span
${TOTAL_PRICE_LABEL}                                xpath=//a[text()='{product_name}']/ancestor::tr//span[starts-with(@id,'total_product_price')]
${PRODUCT_QUANTITY_LABEL}                           xpath=//a[text()='{product_name}']/ancestor::tr//td[@class='cart_quantity text-center']/span
${TOTAL_PRODUCTS_PRICE_LABEL}                       css=#total_product
${TOTAL_SHIPPING_PRICE_LABEL}                       css=#total_shipping
${ORDER_TOTAL_PRICE_LABEL}                          css=#total_price





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
    Wait Until Element Is Visible  ${COLOUR_AND_SIZE_LABEL}
    ${colour_and_size} =  Get Text  ${COLOUR_AND_SIZE_LABEL}
    # index -1 returns the last element - this comes from Python
    ${actual_size} =  Get Substring  ${colour_and_size}  -1
    Should Be Equal As Strings  ${expected_size}  ${actual_size}


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


Get Numeric Value for Product
    [Arguments]  ${product}  ${locator_template}
    ${locator} =  Replace String  ${locator_template}  {product_name}  ${product}
    ${numeric_value} =  Get Number from String Label  ${locator}
    [Return]  ${numeric_value}


Get Number from String Label
    [Arguments]  ${locator}
    ${label} =  Get Text  ${locator}                                             # gets value '$1,250.00', with $ and , for big numbers
    ${value_as_string} =  Remove String  ${label}  $  ,                          # removes $ and ,      $1,250.00=>1250.00
    ${value_as_number} =  Convert To Number  ${value_as_string}                  # gets value 1215.0, which is a number
    [Return]  ${value_as_number}


Get Unit Price for Product
    [Arguments]  ${product}
    ${unit_price} =  Get Numeric Value for Product  ${product}  ${UNIT_PRICE_LABEL}
    [Return]  ${unit_price}


Get Quantity for Product
    [Arguments]  ${product}
    ${quantity} =  Get Numeric Value for Product  ${product}  ${PRODUCT_QUANTITY_LABEL}
    [Return]  ${quantity}


Get Total Price for Product
    [Arguments]  ${product}
    ${total_price} =  Get Numeric Value for Product  ${product}  ${TOTAL_PRICE_LABEL}
    [Return]  ${total_price}


Get Total Products Price
    ${total_products_price} =  Get Number from String Label  ${TOTAL_PRODUCTS_PRICE_LABEL}
    [Return]  ${total_products_price}


Get Total Shipping Price
    ${total_shipping_price} =  Get Number from String Label  ${TOTAL_SHIPPING_PRICE_LABEL}
    [Return]  ${total_shipping_price}


Get Order Total Price
    ${order_total_price} =  Get Number from String Label  ${ORDER_TOTAL_PRICE_LABEL}
    [Return]  ${order_total_price}