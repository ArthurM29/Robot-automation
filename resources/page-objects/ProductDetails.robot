*** Settings ***
Library  Selenium2Library
Resource            ../../resources/common.robot


*** Variables ***
${PRODUCT_NAME}         css=.pb-center-column.col-xs-12.col-sm-4>h1
${ADD_TO_CART_BUTTON}   name=Submit


*** Keywords ***
Verify product is loaded
    [Arguments]  ${item}
    Element Text Should Be  ${PRODUCT_NAME}  ${item}


Add to Shopping Cart
    Click Button  ${ADD_TO_CART_BUTTON}

