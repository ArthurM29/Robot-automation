*** Settings ***
Library  Selenium2Library


*** Variables ***
# string values
${ADDED_TO_CART_MSG}                            Product successfully added to your shopping cart

#locators
${ADDED_TO_CART_LABEL}                          css=.layer_cart_product.col-xs-12.col-md-6>h2
${CLOSE_BUTTON}                                 css=.cross
${ADDTOCART_PROCEED_TO_CHECKOUT_BUTTON}         css=.btn.btn-default.button.button-medium>span



*** Keywords ***
Verify 'Added to Cart' message
    Wait Until Element Is Visible  ${ADDED_TO_CART_LABEL}
    Element Text Should Be  ${ADDED_TO_CART_LABEL}  ${ADDED_TO_CART_MSG}


Click 'Close' button
    Wait Until Element Is Visible  ${CLOSE_BUTTON}
    Click Element  ${CLOSE_BUTTON}


Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ADDTOCART_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ADDTOCART_PROCEED_TO_CHECKOUT_BUTTON}
