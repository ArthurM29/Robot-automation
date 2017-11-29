*** Settings ***
Library  Selenium2Library
Library  String


*** Variables ***
# locators
${SEARCH_FIELD}                id=search_query_top
${SEARCH_BUTTON}               name=submit_search

# search terms
${NO_RESULTS_TERM}             nothing
${SIMPLE_TERM}                 blouse
${PARTIAL_MATCH}               blo
${MULTI_WORD_TERM}             chiffon dress

# Additional search terms to find one result
# skater
# deep



*** Keywords ***
Clear Search Field
    Wait Until Element Is Visible  ${SEARCH_FIELD}
    Clear Element Text  ${SEARCH_FIELD}


Enter Search Term
    [Arguments]  ${term}
    Wait Until Element Is Visible  ${SEARCH_FIELD}
    Input Text  ${SEARCH_FIELD}  ${term}


Click Search Button
    Wait Until Element Is Visible  ${SEARCH_BUTTON}
    Click Button  ${SEARCH_BUTTON}


Hit Enter On Search Button
    Wait Until Element Is Visible  ${SEARCH_BUTTON}
    Press Key  ${SEARCH_BUTTON}  \\13   # ASCII code for Enter Key





