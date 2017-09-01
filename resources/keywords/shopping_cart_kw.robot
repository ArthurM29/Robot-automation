*** Settings ***
Resource            ../page-objects/SearchResults.robot
Resource            ../page-objects/ProductQuickView.robot



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




