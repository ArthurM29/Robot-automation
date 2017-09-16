*** Settings ***
Resource            ../page-objects/SearchResults.robot
Resource            ../page-objects/ProductQuickView.robot
Resource            ../page-objects/ProductDetails.robot
Resource            ../page-objects/TopNav.robot
Resource            ../page-objects/MyAccount.robot
Resource            ../page-objects/MyWishlists.robot




*** Keywords ***
Proceed To 'Quick View'
    SearchResults.Click 'Quick View' Link


Verify 'Quick View' Window Is Displayed
    ProductQuickView.Frame Should Be Loaded


Close 'Quick View' Window
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


View All Images Full Size
    Click 'View Larger' button
    ${image_count} =  Get Count Of Images
    Repeat Keyword  ${image_count} times  View Next Image






















