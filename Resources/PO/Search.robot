*** Settings ***
Library  Selenium2Library


*** Variables ***
${single_search}       Blouse


*** Keywords ***
Clear Search Field
    Clear Element Text  id=search_query_top

Enter Search Term
    [Arguments]  ${term}
    Input Text  id=search_query_top  ${term}

Submit Search
    Click Button  name=submit_search

Verify Result Title Is
    [Arguments]  ${value}
    Element Text Should Be  xpath=//div[@class='product-container']//a[@class='product-name']  ${value}

Verify Results Count Is
    [Arguments]  ${count}
    ${search_results}=  Get Webelements  xpath=//a[@class='product_img_link']/img
    Length Should Be  ${search_results}  ${count}

Verify Results Count Label Is
    [Arguments]  ${message}
    Element Text Should Be   css=.heading-counter  ${message}

Verify Empty Search Message
    Element Text Should Be   css=.alert.alert-warning  Please enter a search keyword

Verify No Search Results Message
    Element Text Should Be  css=.alert.alert-warning  No results were found for your search "nothing"






