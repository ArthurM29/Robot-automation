*** Settings ***
Library             ../MyLibrary.py
Library             Collections
Resource            ../page-objects/Search.robot
Resource            ../page-objects/SearchResults.robot



*** Keywords ***
Search
    [Arguments]  ${term}
    Search.Clear Search Field
    Search.Enter Search Term  ${term}
    Search.Click Search Button


Search with Enter Key
    [Arguments]  ${term}
    Search.Clear Search Field
    Search.Enter Search Term  ${term}
    Search.Hit Enter On Search Button


Verify 'Empty Search' Message
    SearchResults.Warning Message Should Be  ${EMPTY_SEARCH_MSG}


Verify 'No Search Results' Message
    SearchResults.Warning Message Should Be  ${NO_RESULTS_MSG}


Verify Search Results For
    [Arguments]  ${term}
    SearchResults.Result Title Should Be  ${term}
    SearchResults.Results Count Should Be  1


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
    SearchResults.Results Count Label Should Be  ${label}


Verify multiple search results
    [Arguments]  ${expected_results}
    ${search_results}=  Get Webelements  ${SEARCH_RESULT_ITEM}
    ${search_result_names}=  Get Texts In Webelements  ${search_results}
    Lists Should Be Equal  ${search_result_names}  ${expected_results}
