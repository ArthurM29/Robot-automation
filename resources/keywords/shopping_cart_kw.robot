*** Settings ***
Library  String
Library             ../MyLibrary.py
Resource            ../page-objects/SearchResults.robot
Resource            ../page-objects/ProductQuickView.robot
Resource            ../page-objects/ProductDetails.robot
Resource            ../page-objects/TopNav.robot
Resource            ../page-objects/MyAccount.robot
Resource            ../page-objects/MyWishlists.robot
Resource            ../page-objects/AddToCart.robot
Resource            ../page-objects/order/Order_Summary.robot
Resource            ../page-objects/order/Order_Address.robot
Resource            ../page-objects/order/Order_Shipping.robot
Resource            ../page-objects/order/Order_Payment.robot




*** Keywords ***
Proceed To 'Quick View'
    SearchResults.Click 'Quick View' Link
    ProductQuickView.Load The Frame


Verify 'Quick View' Window Is Displayed
    ProductQuickView.Verify The Frame is Loaded


Close 'Quick View' Window
    ProductQuickView.Unload the Frame
    ProductQuickView.Click 'Close' Button


Verify 'Quick View' Window Is Closed
    ProductQuickView.Verify The Frame is Closed


Go To 'Product Details' via Clicking on Product Image
    SearchResults.Click On Product Image


Go To 'Product Details' via Clicking on 'More' button
    SearchResults.Click 'More' button


Proceed to 'Product Details'
    Go To 'Product Details' via Clicking on 'More' button


Go To 'Product Details' via Clicking on product name
    SearchResults.Click on Product Name


Verify 'Product Details' Is Loaded for '${product}'
    ${product}=  Evaluate  '${product}'.title()
    ProductDetails.Verify Page is Loaded for Product ${product}


Write a Product Review
    ProductDetails.Click 'Write Review' Button
    ProductDetails.Select Star Rating  ${FIVE_STAR_RATING_VALUE}
    ProductDetails.Enter Review Title  ${REVIEW_TITLE_VALUE}
    ProductDetails.Enter Review Content  ${REVIEW_CONTENT_VALUE}
    ProductDetails.Submit The Review


Verify Product Review is Added Successfully
    ProductDetails.Verify Review Submitted Successfully


Close 'Review Confirmation' Popup
    ProductDetails.Click 'Ok' On Review Confirmation Popup


Select Size
    ProductDetails.Choose A Size  ${PRODUCT_SIZE_VALUE}


Verify Size Is Selected Successfully
    ProductDetails.Verify Selected Size  ${PRODUCT_SIZE_VALUE}


Enter Quantity
    ProductDetails.Enter Quantity Value  ${PRODUCT_QUANTITY_VALUE}


Verify Quantity Is Selected Successfully
    Verify Entered Quantity  ${PRODUCT_QUANTITY_VALUE}


Add Product To WishList
    ProductDetails.Click 'Add to wishlist'
    ProductDetails.Verify 'Wishlist Confirmation Popup' Displayed
    ProductDetails.Close 'Wishlist Confirmation Popup'


Go To My Wishlist
    TopNav.Go To 'My Account'
    MyAccount.Verify Page Loaded
    MyAccount.Open 'My Wishlists'
    MyWishlists.Verify Page Loaded
    MyWishlists.Open A Wishlist


Verify Product Is Added To Wishlist
    [Arguments]  ${product}
    Go To My Wishlist
    MyWishlists.Verify Product Is In 'My wishlist'  ${product}


Remove Product From Wishlist
    Go To My Wishlist
    MyWishlists.Remove Product


Verify Product Is Removed From Wishlist
    [Arguments]  ${product}
    MyWishlists.Verify Product Is Not In 'My wishlist'  ${product}


Proceed to Order Checkout
    AddToCart.Click 'Proceed To Checkout'


Checkout The Order
    Order_Summary.Click 'Proceed To Checkout'
    Order_Address.Click 'Proceed To Checkout'
    Order_Shipping.Accept Terms Of Service
    Order_Shipping.Click 'Proceed To Checkout'
    Order_Payment.Click On 'Pay by bank wire' Payment Method
    Order_Payment.Click 'Proceed To Checkout'


Checkout The Order and Do Not Accept 'Terms of service'
    Order_Summary.Click 'Proceed To Checkout'
    Order_Address.Click 'Proceed To Checkout'
    # Do Not accept terms of use
    Order_Shipping.Click 'Proceed To Checkout'


Verify Order Checkout Completed Successfully
    Order_Payment.Verify Confirmation Text Displayed


Verify User Is Not Allowed To Proceed To Payment
    Order_Shipping.Verify 'Terms Of Service' Error Popup Displayed
    Order_Shipping.Close 'Terms Of Service' Error Popup


View All Images Full Size
    Click 'View Larger' button
    ${image_count} =  Get Count Of Images
    Repeat Keyword  ${image_count} times  View Next Image


Add Product to Shopping Cart
    ProductDetails.Add to Shopping Cart
    AddToCart.Verify 'Added to Cart' message


Verify Product Is In Shopping Cart
    [Arguments]  ${prod}
    ${products_in_cart} =  Order_Summary.Get Products In Shopping Cart
    Webelements Should Contain Text  ${products_in_cart}  ${prod}


Verify Product Is Not In Shopping Cart
    [Arguments]  ${prod}
    ${products_in_cart} =  Order_Summary.Get Products In Shopping Cart
    # if cart is empty, Pass with message 'Shopping Cart is empty'
    Run Keyword If  '${products_in_cart}' == 'None'  Pass Execution  Shopping Cart is empty
    # if cart not empty, check if it contains ${prod}
    ...  ELSE  Webelements Should Not Contain Text  ${products_in_cart}  ${prod}


Remove Product From Shopping Cart
    Order_Summary.Click 'Delete' icon





















