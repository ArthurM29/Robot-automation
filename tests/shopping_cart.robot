*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/keywords/shopping_cart_kw.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
User is able to quick view a product
    Search  blouse
    Proceed To 'Quick View'
    Verify 'Quick View' Window Is Displayed


User is able to close 'Quick View' window
    Search  blouse
    Proceed To 'Quick View'
    Close 'Quick View' Window
    Verify 'Quick View' Window Is Closed

