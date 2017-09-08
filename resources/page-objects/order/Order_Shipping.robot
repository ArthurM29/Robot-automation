*** Settings ***
Library  Selenium2Library



*** Variables ***
${TERMS_OF_SERVICE_CHECKBOX}                        id=cgv
${ORDERSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}         xpath=//div[@id='center_column']//form/p/button//i
${TERMS_OF_SERVICE_ERROR_MSG}                       css=.fancybox-error
${TERMS_OF_SERVICE_CLOSE_BUTTON}                    css=.fancybox-close



*** Keywords ***
Accept Terms Of Service
    Click Element  ${TERMS_OF_SERVICE_CHECKBOX}


Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${ORDERSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${ORDERSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}


Verify 'Terms Of Service' Error Popup Displayed
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_ERROR_MSG}
    Element Text Should Be  ${TERMS_OF_SERVICE_ERROR_MSG}  You must agree to the terms of service before continuing.


Close 'Terms Of Service' Error Popup
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_CLOSE_BUTTON}
    Click Link  ${TERMS_OF_SERVICE_CLOSE_BUTTON}

