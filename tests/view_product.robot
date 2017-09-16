*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/keywords/view_product_kw.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  Firefox


# robot -d results tests/view_product.robot



*** Test Cases ***
User is able to quick view a product
    Search  ${SIMPLE_TERM}
    Proceed To 'Quick View'
    Verify 'Quick View' Window Is Displayed


User is able to close 'Quick View' window
    Search  ${SIMPLE_TERM}
    Proceed To 'Quick View'
    Close 'Quick View' Window
    Verify 'Quick View' Window Is Closed


User is able to navigate to 'Product Details' via clicking on image
    Search  ${SIMPLE_TERM}
    Go To 'Product Details' via Clicking on Product Image
    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'


User is able to navigate to 'Product Details' via 'More' button
    Search  ${SIMPLE_TERM}
    Go To 'Product Details' via Clicking on 'More' button
    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'


User is able to navigate to 'Product Details' via product name
    Search  ${SIMPLE_TERM}
    Go To 'Product Details' via Clicking on product name
    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'


User is able to write a review
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Search  ${SIMPLE_TERM}
    Go To 'Product Details' via Clicking on 'More' button
    Write a Product Review
    Verify Product Review is Added Successfully
    Close 'Review Confirmation' Popup


User is able to view images of a Product full size
    Search  ${SIMPLE_TERM}
    Proceed to 'Product Details'
    View All Images Full Size


User is able to add a product to Wishlist
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Search  ${SIMPLE_TERM}
    Proceed to 'Product Details'
    Add Product To WishList
    Verify Product Is Added To Wishlist  ${SIMPLE_TERM}


User is able to remove a product from Wishlist
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Search  ${SIMPLE_TERM}
    Proceed to 'Product Details'
    Add Product To WishList
    Remove Product From Wishlist
    Verify Product Is Removed From Wishlist  ${SIMPLE_TERM}








