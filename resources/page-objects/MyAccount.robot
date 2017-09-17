*** Settings ***
Library  Selenium2Library


*** Variables ***
${MY_ACCOUNT_PAGE_TITLE}     My account - My Store
${MY_WISHLISTS_LINK}         css=.lnk_wishlist>a>span
${MY_ADDRESSES_LINK}         css=a[title='Addresses']


*** Keywords ***
Verify Page Loaded
    Wait Until Element Contains  css=.page-heading  MY ACCOUNT
    Title Should Be  ${MY_ACCOUNT_PAGE_TITLE}


Open 'My Wishlists'
    Wait Until Element Is Visible  ${MY_WISHLISTS_LINK}
    Click Element  ${MY_WISHLISTS_LINK}


Open 'My Addresses'
    Wait Until Element Is Visible  ${MY_ADDRESSES_LINK}
    Click Element  ${MY_ADDRESSES_LINK}


