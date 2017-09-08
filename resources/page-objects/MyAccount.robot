*** Settings ***
Library  Selenium2Library


*** Variables ***
${MY_ACCOUNT_PAGE_TITLE}     My account - My Store
${MY_WISHLISTS_LINK}         css=.lnk_wishlist>a>span


*** Keywords ***
Verify Page Loaded
    Title Should Be  ${MY_ACCOUNT_PAGE_TITLE}


Open 'My Wishlists'
    Wait Until Element Is Visible  ${MY_WISHLISTS_LINK}
    Click Element  ${MY_WISHLISTS_LINK}


