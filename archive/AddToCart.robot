*** Settings ***
Library  Selenium2Library


*** Variables ***
# string values
${ADDED_TO_CART_MSG}            Product successfully added to your shopping cart

#locators
${ADDED_TO_CART_LABEL}          css=.layer_cart_product.col-xs-12.col-md-6>h2
${CLOSE_BUTTON}                 css=.cross


*** Keywords ***
Verify 'Added to Cart' message
    Wait Until Element Contains  ${ADDED_TO_CART_LABEL}  ${ADDED_TO_CART_MSG}
    Element Text Should Be  ${ADDED_TO_CART_LABEL}  ${ADDED_TO_CART_MSG}


Click 'Close' button
    Wait Until Element Is Visible  ${CLOSE_BUTTON}
    Click Element  ${CLOSE_BUTTON}
