*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/keywords/shopping_cart_kw.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# TODO remove this after testing
Library  Selenium2Library
Library  String

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


#User is able to remove a product from Shopping Cart
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add Product to Shopping Cart
#    Proceed to Order Checkout
#    Verify Product Is In Shopping Cart  ${SIMPLE_TERM}
#    Remove Product From Shopping Cart
#    Verify Product Is Not In Shopping Cart  ${SIMPLE_TERM}


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


#User is able to read 'Terms of service'
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Shipping'
#    Open 'Terms of service'
#    Verify 'Terms of service' is opened successfully


#User is able to specify quantity when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Enter Product Quantity  3
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Quantity Is  3


#User is able to increase quantity when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Increase Quantity By One
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Quantity Is  2


#User is able to decrease quantity when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Enter Product Quantity  3
#    Decrease Quantity By One
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Quantity Is  2


#User is able to specify size when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Select Product Size  M
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Size Is  M


#User is able to specify colour when buying a product
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Select Product Colour  White
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Colour Is  White


#User is able to choose 'Pay by bank wire' payment method
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Select 'Pay by bank wire' Payment Method
#    Verify Payment Method Is  Bank-wire payment.


#User is able to choose 'Pay by check' payment method
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Select 'Pay by check' Payment Method
#    Verify Payment Method Is  Check payment


#Correct value is displayed for 'Product Price'
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Enter Product Quantity  2
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Product Price Is  $54.00
#
#
#Correct value is displayed for 'Total Price'
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Enter Product Quantity  2
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Payment'
#    Verify Total Price Is  $56.00


User is able to create a shipping address
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Go To 'My Addresses'
    Create A Shipping Address  TestAddress1
    Verify Shipping Address Is Created  TestAddress1
    # clear test results
    Delete Shipping Address  TestAddress1
#
#
#User is able to delete a shipping address
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Go To 'My Addresses'
#    # create a shipping address to delete later
#    Create A Shipping Address  TestAddress2
#    Delete Shipping Address  TestAddress2
#    Verify Shipping Address Is Deleted  TestAddress2


#User without shipping address is able to add an address and proceed to checkout
#    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
#    Go To 'My Addresses'
#    Delete All Shipping Addresses
#    Search  ${SIMPLE_TERM}
#    Proceed to 'Product Details'
#    Add To Shopping Cart
#    Proceed to Order Checkout
#    Proceed to 'Order Address'
#    Enter Shipping Address Values and Submit  MainAddress
#    Verify Shipping Address Is Created  MainAddress
#    Checkout The Order From Address
#    Verify Order Checkout Completed Successfully


