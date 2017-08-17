*** Settings ***
Library  Selenium2Library
Library  Collections
Resource            ../Resources/PO/Search.robot
Resource            ../../Resources/keywords.robot


*** Keywords ***
Search
    [Arguments]  ${term}
    Navigate To Home Page
    Search.Clear Search Field
    Search.Enter Search Term  ${term}
    Search.Submit Search

Verify Results Count and Label
    [Arguments]  ${count}
    Search.Verify Results Count Is  ${count}
    ${label}=  Catenate  ${count}
    Search.Verify Results Count Label Is



Results should contain
    # verify number of search results
    ${search_results}=  Get Webelements  xpath=//div[@class='product-container']//a[@class='product-name']
    # verify title of the first dress
    ${element1}=  Get From List  ${search_results}  0
    Element Text Should Be  ${element1}  Printed Chiffon Dress
    # verify title of second dress
    ${element2}=  Get From List  ${search_results}  1
    Element Text Should Be  ${element2}  Printed Summer Dress












