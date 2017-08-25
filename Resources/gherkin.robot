*** Settings ***
Resource            ../Resources/PO/SearchResults.robot
Resource            ../Resources/PO/ProductDetails.robot
Resource            ../Resources/PO/AddToCart.robot
Resource            PO/ShoppingCart.robot
Resource            search_keywords.robot
Library  Dialogs



*** Variables ***
${CLOSE_BUTTON}


*** Keywords ***
user is not logged in the application
    Navigate To Home Page


user searches for product
    [Arguments]  ${product}
    Search  ${product}


the product is present in search results
    [Arguments]  ${product}
    Search Results should contain  ${product}


user adds the product to Shopping Cart
    [Arguments]  ${product}
    SearchResults.Click 'Add to Cart' button for  ${product}
    AddToCart.Click 'Close' button


the product is present in Shopping Cart
    [Arguments]  ${product}
    ShoppingCart.Verify Shopping Cart Contains Product  ${product}


#user adds the product to Shopping Cart
#    [Arguments]  ${product}
#    ProductDetails.Add to Shopping Cart
#    AddToCart.Verify 'Added to Cart' message
#    AddToCart.Click 'Close' button




#user proceeds to view Product Details
#    [Arguments]  ${product}
#    SearchResults.Click 'More' button
#    ProductDetails.Verify product is loaded  ${product}
#
#
#user adds the product to Shopping Cart
#    [Arguments]  ${product}
#    ProductDetails.Add to Shopping Cart
#    AddToCart.Verify 'Added to Cart' message
#    AddToCart.Click 'Close' button
#

#
#
#user removes the product from Shopping Cart
#    [Arguments]  ${product}
#    ShoppingCart.Open Shopping Cart
#    Click Link  xpath=//div[@class='product-name']//a[text()='${product}']/parent::div/parent::div/following-sibling::span/a
#
#
#the product is not present in Shopping Cart
#    [Arguments]  ${product}
#    ShoppingCart.Verify Shopping Cart Doesn't Contain Product  ${product}



