*** Settings ***
Library  Selenium2Library
Library  Dialogs


*** Variables ***
${QUICK_VIEW_LINK}              css=.quick-view
${PRODUCT_IMAGE}                xpath=//a[@class='product_img_link']/img
${MORE_BUTTON}                  css=.button.lnk_view.btn.btn-default
${PRODUCT_NAME_LOCATOR}         xpath=//div[@class='product-container']//a[@class='product-name']


*** Keywords ***
Click 'Quick View' Link
    Mouse Over  ${PRODUCT_IMAGE}
    # at this step 'Quick View' button is not visible in chrome
    Click Link  ${QUICK_VIEW_LINK}


Click On Product Image
    Click Image  ${PRODUCT_IMAGE}


Click 'More' button
    Mouse Over  ${PRODUCT_IMAGE}
    Click Element  ${MORE_BUTTON}

Click on Product Name
    Click Link  ${PRODUCT_NAME_LOCATOR}





