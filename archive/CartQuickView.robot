*** Settings ***
Library  Selenium2Library
Library  ../../Tests/MyLibrary.py
Library  Dialogs


*** Variables ***
# string values
${CHECKOUT_BUTTON}        css=#button_order_cart>span

#locators
${SHOPPING_CART}          css=.shopping_cart>a
${PRODUCTS_IN_CART}       xpath=//div[@class='product-name']//a


*** Keywords ***
Open Shopping Cart
    Mouse Over  ${SHOPPING_CART}
    Wait Until Element Is Visible  ${CHECKOUT_BUTTON}


Verify Shopping Cart Contains Product
    [Arguments]  ${product}
    Open Shopping Cart
    ${products_in_cart}=  Get Webelements  ${PRODUCTS_IN_CART}
    Webelements Should Contain Text  ${products_in_cart}  ${product}



