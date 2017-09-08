*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/keywords/signin_kw.robot
Resource            ../resources/keywords/shopping_cart_kw.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# robot -d results tests/shopping_cart.robot
# TODO consider adding Login step to missing test
# TODO move Login and search to setup step


*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  Firefox


*** Test Cases ***
#User is able to quick view a product
#    Search  ${SIMPLE_TERM}
#    Proceed To 'Quick View'
#    Verify 'Quick View' Window Is Displayed
#
#
#User is able to close 'Quick View' window
#    Search  ${SIMPLE_TERM}
#    Proceed To 'Quick View'
#    Close 'Quick View' Window
#    Verify 'Quick View' Window Is Closed
#
#
#User is able to navigate to 'Product Details' via clicking on image
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on Product Image
#    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'
#
#
#User is able to navigate to 'Product Details' via 'More' button
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on 'More' button
#    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'
#
#
#User is able to navigate to 'Product Details' via product name
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on product name
#    Verify 'Product Details' Is Loaded for '${SIMPLE_TERM}'


#User is able to view images of a Product full size
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    View All Images Full Size


#User is able to write a review
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on 'More' button
#    Write a Product Review
#    Verify Product Review is Added Successfully
#    Close 'Review Confirmation' Popup


#User is able to choose a size
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on 'More' button
#    Select Size
#    Verify Size Is Selected Successfully


#User is able to choose quantity
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Go To 'Product Details' via Clicking on 'More' button
#    Enter Quantity
#    Verify Quantity Is Selected Successfully


#User is able to add a product to Wishlist
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add Product To WishList
#    Verify Product Is Added To Wishlist  ${SIMPLE_TERM}


#User is able to remove a product from Wishlist
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add Product To WishList
#    Remove Product From Wishlist
#    Verify Product Is Removed From Wishlist  ${SIMPLE_TERM}


#User is able to add a product to Shopping Cart
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add Product to Shopping Cart
#    Proceed to Order Checkout
#    Verify Product Is In Shopping Cart  ${SIMPLE_TERM}


User is able to remove a product from Shopping Cart
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Search  ${SIMPLE_TERM}
    Proceed to 'Product Details'
    Add Product to Shopping Cart
    Proceed to Order Checkout
    Verify Product Is In Shopping Cart  ${SIMPLE_TERM}
    Remove Product From Shopping Cart
    Verify Product Is Not In Shopping Cart  ${SIMPLE_TERM}


#User is able to checkout a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Checkout The Order
#    Verify Order Checkout Completed Successfully


#User is not able to checkout a product without accepting 'Terms of service'
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Checkout The Order and Do Not Accept 'Terms of service'
#    Verify User Is Not Allowed To Proceed To Payment


# TODO this is kisat prat
#User is able to specify quantity when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Checkout The Order
#    Verify Order Checkout Completed Successfully














