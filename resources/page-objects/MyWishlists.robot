*** Settings ***
Library  Selenium2Library


*** Variables ***
${MY_WISHLIST_LINK}             xpath=//tr/td[1]/a
${PRODUCT_IN_WISHLIST}          css=#s_title
${REMOVE_PRODUCT_ICON}          css=.icon-remove-sign



*** Keywords ***
Open A Wishlist
    Wait Until Element Is Visible  ${MY_WISHLIST_LINK}
    Click Link  ${MY_WISHLIST_LINK}


Verify Product Is In 'My wishlist'
    [Arguments]  ${product}
    ${product}=  Evaluate  '${product}'.title()
    Wait Until Element Is Visible  ${PRODUCT_IN_WISHLIST}
    Element Should Contain  ${PRODUCT_IN_WISHLIST}  ${product}


Verify Product Is Not In 'My wishlist'
    [Arguments]  ${product}
    ${product}=  Evaluate  '${product}'.title()
    Wait Until Element Is Not Visible  ${PRODUCT_IN_WISHLIST}
    Element Should Not Contain  ${PRODUCT_IN_WISHLIST}  ${product}


Verify Page Loaded
    Wait Until Page Contains  My wishlists


Remove Product
    Wait Until Element Is Visible  ${REMOVE_PRODUCT_ICON}
    Click Element  ${REMOVE_PRODUCT_ICON}


