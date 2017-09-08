*** Settings ***
Library  Selenium2Library
Library  Dialogs



*** Variables ***
${ORDERSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}          css=.button.btn.btn-default.standard-checkout.button-medium>span
${PRODUCT_IN_CART}                                  //tr[starts-with(@class,'cart_item')]//p/a
${DELETE_ICON}                                      xpath=//a[@title='Delete']



*** Keywords ***
Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ORDERSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERSUMMARY_PROCEED_TO_CHECKOUT_BUTTON}


Get Products In Shopping Cart
    ${product_count} =  Get Matching Xpath Count  ${PRODUCT_IN_CART}
    Run Keyword And Return If  ${product_count} > 0  Get Webelements  ${PRODUCT_IN_CART}

Click 'Delete' icon
    Wait Until Element Is Visible  ${DELETE_ICON}
    Click Link  ${DELETE_ICON}
    Wait Until Element Is Not Visible  ${DELETE_ICON}


