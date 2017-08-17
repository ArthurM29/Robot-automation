*** Settings ***
Resource            ../Resources/PO/HomePage.robot
Resource            ../Resources/PO/Search.robot
Resource            ../Resources/PO/SignIn.robot
Resource            ../Resources/PO/MyAccount.robot
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

Results should contain
    # verify number of search results
    ${search_results}=  Get Webelements  xpath=//div[@class='product-container']//a[@class='product-name']
    # verify title of the first dress
    ${element1}=  Get From List  ${search_results}  0
    Element Text Should Be  ${element1}  Printed Chiffon Dress
    # verify title of second dress
    ${element2}=  Get From List  ${search_results}  1
    Element Text Should Be  ${element2}  Printed Summer Dress


Search_Count Label for ${term} is ${label}
    Search  ${term}
    Search.Results Count Label Should Be  ${label}
