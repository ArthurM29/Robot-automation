*** Settings ***
Library  Selenium2Library


*** Variables ***
${QUICK_VIEW_LINK}                          css=.quick-view
${PRODUCT_IMAGE}                            xpath=//a[@class='product_img_link']/img
${MORE_BUTTON}                              css=.button.lnk_view.btn.btn-default
${PRODUCT_NAME_LOCATOR}                     xpath=//div[@class='product-container']//a[@class='product-name']
${SEARCH_RESULTS_ADD_TO_CART_BUTTON}        css=.button.ajax_add_to_cart_button.btn.btn-default>span


*** Keywords ***
Click 'Quick View' Link
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    # at this step 'Quick View' button is not visible in chrome
    Wait Until Element Is Visible  ${QUICK_VIEW_LINK}
    Click Link  ${QUICK_VIEW_LINK}


Click On Product Image
    Click Image  ${PRODUCT_IMAGE}


Click 'More' button
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    Wait Until Element Is Visible  ${MORE_BUTTON}
    Click Element  ${MORE_BUTTON}


Click on Product Name
    Click Link  ${PRODUCT_NAME_LOCATOR}


Click 'Add to Cart' Button
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    Wait Until Element Is Visible  ${SEARCH_RESULTS_ADD_TO_CART_BUTTON}
    Click Element  ${SEARCH_RESULTS_ADD_TO_CART_BUTTON}





