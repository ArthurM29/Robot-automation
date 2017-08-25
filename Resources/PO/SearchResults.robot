*** Settings ***
Library  Selenium2Library
Library  String
Resource            ../../Resources/Common.robot


*** Variables ***
${MORE_BUTTON}          css=.button.lnk_view.btn.btn-default
${FOUND_PRODUCTS}       xpath=//div[@class='product-container']//a[@class='product-name']
${ADD_TO_CART_BUTTON}   xpath=//div[@class='right-block']/h5//*[contains(text(), '{product_placeholder}')]//parent::h5//following-sibling::div[@class='button-container']/a[1]/span
${CLOSE_CART_BUTTON}



*** Keywords ***
Click 'More' button
    Click Link  ${MORE_BUTTON}


Click 'Add to Cart' button for
    [Arguments]  ${product}
    ${add_to_cart_button}=   Replace String  ${ADD_TO_CART_BUTTON}  {product_placeholder}  ${product}
    Wait Until Element Is Visible  ${add_to_cart_button}
    Click Element  ${add_to_cart_button}





