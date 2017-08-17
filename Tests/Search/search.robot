*** Settings ***
Resource            ../../Resources/search_keywords.robot
Resource            ../../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
Search without entering search keyword
    Search  ${EMPTY}
    Verify 'Empty Search' Message


Search with no result
    Search  ${NO_RESULTS_TERM}
    Verify 'No Search Results' Message


Search with one result
    Search  ${SIMPLE_TERM}
    Verify Search Results For  ${SIMPLE_TERM}


Search works with partial match
    Search  ${PARTIAL_MATCH}
    Verify Search Results For  ${SIMPLE_TERM}


Search ignores spaces from both sides of search term
    ${search_term}=  Catenate  ${SPACE} ${SIMPLE_TERM} ${SPACE}
    Search  ${search_term}
    Verify Search Results For  ${SIMPLE_TERM}


Search is case-insensitive
    [Template]  Search And Verify Results
    blouse
    BLOUSE
    BloUse


Search works with Enter key
    Search with Enter Key  ${SIMPLE_TERM}
    Verify Search Results For  ${SIMPLE_TERM}


Verify Search Count Label
    [Template]  Search_Count Label for ${term} is ${label}
    ${NO_RESULTS_TERM}     0 results have been found.
    ${SIMPLE_TERM}         1 result has been found.
    dress                  7 results have been found.





#Search with multi-word string
#sleep  5
#     Search  chiffon dress
#     Results Count Should Be  2
#     Results Count Label Should Be  2 results have been found.
#     Results should contain




#
#
#Search - multiple results
#    Search  printed
#    Results Count Should Be  5
#    Results Count Label Should Be  5 results have been found.
#     # TODO loop through ${search_results} and verify title of each element
#





