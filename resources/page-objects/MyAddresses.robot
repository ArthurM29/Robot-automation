*** Settings ***
Library  Selenium2Library
Library  String
Library  ../MyLibrary.py
Library  Dialogs


*** Variables ***
# locate Delete button for given address name
${DELETE_BUTTON}                xpath=//div[@class="bloc_adresses row"]//h3[text()='{placeholder}']/parent::li//parent::ul//a[@title='Delete']
${ALL_DELETE_BUTTONS}           xpath=//div[@class="bloc_adresses row"]//a[@title='Delete']
${ADD_NEW_ADDRESS_BUTTON}       xpath=//div[@class="clearfix main-page-indent"]/a
${ADDRESS_TITLE}                css=.page-subheading
${ADDRESSES_SECTION}            css=#columns
${NO_ADDRESS_LABEL}             //p[@class="alert alert-warning"]
${ADDRESS_DROP_DOWN}            id=id_address_delivery

# address fields
${FIRST_NAME_FIELD}                    id=firstname
${LAST_NAME_FIELD}                     id=lastname
${COMPANY_FIELD}                       id=company
${ADDRESS1_FIELD}                      id=address1
${ADDRESS2_FIELD}                      id=address2
${CITY_FIELD}                          id=city
${STATE_DROP_DOWN}                     id=id_state
${ZIP_CODE_FIELD}                      id=postcode
${COUNTRY_DROW_DOWN}                   id=id_country
${HOME_PHONE_FIELD}                    id=phone
${MOBILE_PHONE_FIELD}                  id=phone_mobile
${ADDRESS_TITLE_FIELD}                 id=alias
${SAVE_BUTTON}                         id=submitAddress




*** Keywords ***
Remove Shipping Address
    [Arguments]  ${address}
    ${locator} =  Replace String  ${DELETE_BUTTON}  {placeholder}  ${address}
    Wait Until Element Is Visible  ${locator}
    Click Element  ${locator}
    Confirm Action   # click OK on confirmation popup


Remove All Shipping Addresses
    @{all_delete_elements} =  Get Webelements  ${ALL_DELETE_BUTTONS}
    :FOR  ${delete_button}  IN  @{all_delete_elements}
    \  Wait Until Element Is Visible  ${delete_button}
    \  Click Element  ${delete_button}
    \  Confirm Action   # click OK on confirmation popup
    \  Wait Until Element Is Visible  ${ADDRESSES_SECTION}


Address Should Be Deleted
    [Arguments]  ${address}
    Wait Until Page Does Not Contain  ${address}
    Page Should Not Contain  ${address}


Click 'Add a new address Button'
    Wait Until Element Is Visible  ${ADD_NEW_ADDRESS_BUTTON}
    Click Element  ${ADD_NEW_ADDRESS_BUTTON}

Populate Shipping Address Fields and Submit
    [Arguments]  ${title}
    # fill in values
    Input Text  ${FIRST_NAME_FIELD}  Arthur
    Input Text  ${LAST_NAME_FIELD}  M.
    Input Text  ${COMPANY_FIELD}  Home
    Input Text  ${ADDRESS1_FIELD}  Kasyan 7, 97
    Input Text  ${ADDRESS2_FIELD}  Barekamutyun
    Input Text  ${CITY_FIELD}  Yerevan
    Select From List By Label  ${STATE_DROP_DOWN}  North Carolina
    Input Text  ${ZIP_CODE_FIELD}  12345
    Select From List By Label  ${COUNTRY_DROW_DOWN}  United States
    Input Text  ${HOME_PHONE_FIELD}  505606707
    Input Text  ${MOBILE_PHONE_FIELD}  111222333
    Input Text  ${ADDRESS_TITLE_FIELD}  ${title}
    Click Element  ${SAVE_BUTTON}


Shipping Address Should Be Created
    [Arguments]  ${title}
    Wait Until Element Is Visible  ${ADDRESSES_SECTION}
    Page Should Contain  ${title}


Select Address From Drop-down
    [Arguments]  ${address}
    Wait Until Element Is Visible  ${ADDRESS_DROP_DOWN}
    Select From List By Label  ${ADDRESS_DROP_DOWN}  ${address}

Address Should Be Selected
    [Arguments]  ${address}
    Wait Until Element Is Visible  ${ADDRESS_DROP_DOWN}
    ${selected_address} =  Get Selected List Label  ${ADDRESS_DROP_DOWN}
    Should Be Equal As Strings  ${address}  ${selected_address}


