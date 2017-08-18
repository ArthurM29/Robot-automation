*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/PO/SearchResults.robot
Resource            ../Resources/PO/ShoppingCart.robot
Resource            ../Resources/search_keywords.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
User is able to add item to Shopping Cart
    Search  ${SIMPLE_TERM}
    sleep  5
    SearchResults.Click 'Add to cart' link
    ShoppingCart.Verify Item Is Added To Shopping Cart

