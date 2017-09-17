*** Settings ***
Resource            ../page-objects/SearchResults.robot
Resource            ../page-objects/ProductDetails.robot
Resource            ../page-objects/AddToCart.robot
Resource            search_kw.robot
Resource            order_checkout_kw.robot



*** Keywords ***
user is not logged in the application
    Log  Launch Application without logging in


user searches for product
    [Arguments]  ${product}
    Search  ${product}


the product is present in search results
    [Arguments]  ${product}
    Search Results should contain  ${product}


user proceeds to view Product Details
    [Arguments]  ${product}
    SearchResults.Click 'More' button
    ProductDetails.Verify Page is Loaded for Product ${product}


user adds the product to Shopping Cart
    [Arguments]  ${product}
    ProductDetails.Add to Shopping Cart
    AddToCart.Verify 'Added to Cart' message


the product is present in Shopping Cart
    [Arguments]  ${product}
    Proceed to Order Checkout
    Verify Product Is In Shopping Cart  ${product}






