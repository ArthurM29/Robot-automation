*** Settings ***
Library             ../Tests/MyLibrary.py
Resource            ../Resources/PO/HomePage.robot
Resource            ../Resources/PO/Search.robot
Resource            ../Resources/PO/SignIn.robot
Resource            ../Resources/PO/MyAccount.robot
Resource            ../Resources/PO/SearchResults.robot
Resource            sign_in_keywords.robot


*** Keywords ***
Search
    [Arguments]  ${term}
    Navigate To Home Page
    Search.Clear Search Field
    Search.Enter Search Term  ${term}
    Search.Click Search Button

Search with Enter Key
    [Arguments]  ${term}
    Navigate To Home Page
    Search.Clear Search Field
    Search.Enter Search Term  ${term}
    Search.Hit Enter On Search Button

Verify 'Empty Search' Message
    Search.Warning Message Should Be  ${EMPTY_SEARCH_MSG}

Verify 'No Search Results' Message
    Search.Warning Message Should Be  ${NO_RESULTS_MSG}

Verify Search Results For
    [Arguments]  ${term}
    Search.Result Title Should Be  ${term}
    Search.Results Count Should Be  1

Search And Verify Results
    [Arguments]  ${term}
    Search  ${term}
    Verify Search Results For  ${term}

Search Results Should Contain
    [Arguments]  ${product}
    ${search_results}=  Get Webelements  ${FOUND_PRODUCTS}
    Webelements Should Contain Text  ${search_results}  ${product}

Search_Count Label for ${term} is ${label}
    Search  ${term}
    Search.Results Count Label Should Be  ${label}
