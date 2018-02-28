*** Settings ***
Library  Selenium2Library
Library  String



*** Variables ***
${CHECKOUTSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}          css=.button.btn.btn-default.standard-checkout.button-medium>span
${PRODUCT_IN_CART}                                     //tr[starts-with(@class,'cart_item')]//p/a
${DELETE_ICON}                                         xpath=//a[text()='{placeholder}']/ancestor::tr//i[@class="icon-trash"]



*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${CHECKOUTSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${CHECKOUTSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}


Get Products In Shopping Cart
    ${product_count} =  Get Matching Xpath Count  ${PRODUCT_IN_CART}
    Run Keyword And Return If  ${product_count} > 0  Get Webelements  ${PRODUCT_IN_CART}


Click 'Delete' icon
    [Arguments]  ${product}
    ${locator} =  Replace String  ${DELETE_ICON}  {placeholder}  ${product}
    Wait Until Element Is Visible  ${locator}
    Click Element  ${locator}
    Wait Until Element Is Not Visible  ${locator}


