*** Settings ***
Resource            ../../Resources/keywords.robot
Resource            ../../Resources/search.robot
Resource            ../../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
Search without entering search keyword
    Search.Search  ${EMPTY}
    Verify Empty Search Message

Search with no result
    Search.Search  nothing
    Verify No Search Results Message
    Results Count Label Should Be    0 results have been found.


#Search with one result
#    Search  blouse
#    Result Title Should Be  Blouse
#    Results Count Should Be  1
#    Results Count Label Should Be  1 result has been found.
#
#
#Search - multiple results
#    Search  printed
#    Results Count Should Be  5
#    Results Count Label Should Be  5 results have been found.
#     # TODO loop through ${search_results} and verify title of each element
#

Search is case-insensitive
    [Template]  Search And Verify Results
    blouse
    BLOUSE
    BloUse


#Search works with partial match
#    Search  blo
#    Result Title Should Be  Blouse
#    Results Count Should Be  1
#    Results Count Label Should Be  1 result has been found.
#
#
#Search works with Enter key
#    Input Text  id=search_query_top  blouse
#    Press Key  id=search_query_top  \\13   # ASCII code for Enter Key
#    Result Title Should Be  Blouse
#    Results Count Should Be  1
#    Results Count Label Should Be  1 result has been found.
#
#
#Search ignores spaces from both sides of search keyword
#    ${search_keyword}=  Catenate  ${SPACE} blouse ${SPACE}
#    Search  ${search_keyword}
#    Result Title Should Be  Blouse
#    Results Count Should Be  1
#    Results Count Label Should Be  1 result has been found.


#Search with multi-word string
#sleep  5
#     Search  chiffon dress
#     Results Count Should Be  2
#     Results Count Label Should Be  2 results have been found.
#     Results should contain

