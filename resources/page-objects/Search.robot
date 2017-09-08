*** Settings ***
Library  Selenium2Library
Library  String


*** Variables ***
# locators
${SEARCH_WARNING}              css=.alert.alert-warning
${SEARCH_FIELD}                id=search_query_top
${SEARCH_BUTTON}               name=submit_search
${SEARCH_RESULT_ITEM}          xpath=//div[@class='product-container']//a[@class='product-name']
${RESULT_COUNT_LABEL}          css=.heading-counter

# strings
${EMPTY_SEARCH_MSG}            Please enter a search keyword
${NO_RESULTS_MSG}              No results were found for your search "nothing"

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
    Clear Element Text  ${SEARCH_FIELD}

Enter Search Term
    [Arguments]  ${term}
    Input Text  ${SEARCH_FIELD}  ${term}

Click Search Button
    Click Button  ${SEARCH_BUTTON}

Hit Enter On Search Button
    Press Key  ${SEARCH_BUTTON}  \\13   # ASCII code for Enter Key

Result Title Should Be
    [Arguments]  ${value}
    # convert to Camelcase to have correct matching for other-case inputs
    ${camel_case_value}  Evaluate  'blouse'.title()
    Element Text Should Be  ${SEARCH_RESULT_ITEM}  ${camel_case_value}

Results Count Should Be
    [Arguments]  ${count}
    ${search_results}=  Get Webelements  ${SEARCH_RESULT_ITEM}
    Length Should Be  ${search_results}  ${count}

Results Count Label Should Be
    [Arguments]  ${message}
    Element Text Should Be   ${RESULT_COUNT_LABEL}  ${message}

Warning Message Should Be
    [Arguments]  ${message}
    Element Text Should Be   ${SEARCH_WARNING}  ${message}




