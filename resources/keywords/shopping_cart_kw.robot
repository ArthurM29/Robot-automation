*** Settings ***
Library  String
Resource            ../page-objects/SearchResults.robot
Resource            ../page-objects/ProductQuickView.robot
Resource            ../page-objects/ProductDetails.robot



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





