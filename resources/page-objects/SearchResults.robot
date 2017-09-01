*** Settings ***
Library  Selenium2Library
Library  Dialogs


*** Variables ***
${QUICK_VIEW_LINK}              css=.quick-view
${PRODUCT_IMAGE}                xpath=//a[@class='product_img_link']/img


*** Keywords ***
Click 'Quick View' Link
    Mouse Over  ${PRODUCT_IMAGE}
    # at this step 'Quick View' button is not visible in chrome
    Click Link  ${QUICK_VIEW_LINK}








