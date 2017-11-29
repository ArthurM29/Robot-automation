*** Settings ***
Library  Selenium2Library


*** Variables ***
${SEARCH_RESULT_ITEM}                       xpath=//div[@class='product-container']//a[@class='product-name']
${SEARCH_WARNING}                           css=.alert.alert-warning
${RESULT_COUNT_LABEL}                       css=.heading-counter
${SEARCH_HEADING}                           css=.page-heading.product-listing
${QUICK_VIEW_LINK}                          css=.quick-view
${PRODUCT_IMAGE}                            xpath=//a[@class='product_img_link']/img
${MORE_BUTTON}                              css=.button.lnk_view.btn.btn-default
${PRODUCT_NAME_LOCATOR}                     xpath=//div[@class='product-container']//a[@class='product-name']
${SEARCH_RESULTS_ADD_TO_CART_BUTTON}        css=.button.ajax_add_to_cart_button.btn.btn-default>span
${FOUND_PRODUCTS}                           xpath=//div[@class='product-container']//a[@class='product-name']

# strings
${EMPTY_SEARCH_MSG}            Please enter a search keyword
${NO_RESULTS_MSG}              No results were found for your search "nothing"



*** Keywords ***
Result Title Should Be
    [Arguments]  ${value}
    # make sure you are on search page for the common locators not to work on previous page
    Wait Until Page Contains Element  ${SEARCH_HEADING}
    Wait Until Element Is Visible  ${SEARCH_RESULT_ITEM}
    ${actual_value} =  Get Text  ${SEARCH_RESULT_ITEM}
    Should Be Equal As Strings  ${value}  ${actual_value}  ignore_case=true


Results Count Should Be
    [Arguments]  ${count}
    Wait Until Element Is Visible  ${SEARCH_RESULT_ITEM}
    ${search_results}=  Get Webelements  ${SEARCH_RESULT_ITEM}
    Length Should Be  ${search_results}  ${count}


Results Count Label Should Be
    [Arguments]  ${message}
    Wait Until Element Is Visible  ${RESULT_COUNT_LABEL}
    Element Text Should Be   ${RESULT_COUNT_LABEL}  ${message}


Warning Message Should Be
    [Arguments]  ${message}
    Wait Until Element Is Visible  ${SEARCH_WARNING}
    Element Text Should Be   ${SEARCH_WARNING}  ${message}


Click 'Quick View' Link
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    # at this step 'Quick View' button is not visible in chrome
    Wait Until Element Is Visible  ${QUICK_VIEW_LINK}
    Click Link  ${QUICK_VIEW_LINK}


Click On Product Image
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Click Image  ${PRODUCT_IMAGE}


Click 'More' button
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    Wait Until Element Is Visible  ${MORE_BUTTON}
    Click Element  ${MORE_BUTTON}


Click on Product Name
    Wait Until Element Is Visible  ${PRODUCT_NAME_LOCATOR}
    Click Link  ${PRODUCT_NAME_LOCATOR}


Click 'Add to Cart' Button
    Wait Until Element Is Visible  ${PRODUCT_IMAGE}
    Mouse Over  ${PRODUCT_IMAGE}
    Wait Until Element Is Visible  ${SEARCH_RESULTS_ADD_TO_CART_BUTTON}
    Click Element  ${SEARCH_RESULTS_ADD_TO_CART_BUTTON}





