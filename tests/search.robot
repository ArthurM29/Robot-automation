*** Settings ***
Resource            ../resources/keywords/search_kw.robot
Resource            ../resources/common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test
Library  Dialogs


# robot -d results tests/search.robot


*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  Firefox



*** Test Cases ***
User is able to search successfully
    Search  ${SIMPLE_TERM}
    Verify Search Results For  ${SIMPLE_TERM}


Search without entering search keyword
    Search  ${EMPTY}
    Verify 'Empty Search' Message


Search with no result
    Search  ${NO_RESULTS_TERM}
    Verify 'No Search Results' Message


Search works with partial match
    Search  ${PARTIAL_MATCH}
    Verify Search Results For  ${SIMPLE_TERM}


Search is case-insensitive
    [Template]  Search And Verify Results
    blouse
    BLOUSE
    BloUse


Search ignores spaces from both sides of search term
    ${search_term}=  Catenate  ${SPACE} ${SIMPLE_TERM} ${SPACE}
    Search  ${search_term}
    Verify Search Results For  ${SIMPLE_TERM}


Search works with Enter key
    Search with Enter Key  ${SIMPLE_TERM}
    Verify Search Results For  ${SIMPLE_TERM}


Verify Search Count Label
    [Template]  Search_Count Label for ${term} is ${label}
    ${NO_RESULTS_TERM}     0 results have been found.
    ${SIMPLE_TERM}         1 result has been found.
    dress                  7 results have been found.


Search works properly for multiple search results
    Search  short sleeve
    ${expected_results}=  Create List  Faded Short Sleeve T-shirts  Blouse  Printed Dress  Printed Summer Dress
    Verify Multiple Search Results  ${expected_results}




