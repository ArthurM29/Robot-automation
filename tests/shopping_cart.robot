*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/keywords/signin_kw.robot
Resource            ../resources/keywords/shopping_cart_kw.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

# robot -d results tests/shopping_cart.robot
# TODO consider adding Login step
# TODO move Login and search to setup step

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


User is able to choose quantity
    Sign In  ${VALID_EMAIL}  ${VALID_PASSWORD}
    Search  ${SIMPLE_TERM}
    Go To 'Product Details' via Clicking on 'More' button
    Enter Quantity
    Verify Quantity Is Selected Successfully





















