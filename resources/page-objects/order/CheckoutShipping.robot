*** Settings ***
Library  Selenium2Library



*** Variables ***
${TERMS_OF_SERVICE_CHECKBOX}                            id=cgv
${CHECKOUTSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}          xpath=//div[@id='center_column']//form/p/button//i
${TERMS_OF_SERVICE_ERROR_MSG}                           css=.fancybox-error
${TERMS_OF_SERVICE_CLOSE_BUTTON}                        css=.fancybox-close
${TERMS_OF_SERVICE_LINK}                                css=.iframe
${TERMS_OF_SERVICE_HEADER}                              xpath=//div[@class="rte content_only"]/h1
${CLOSE_TERMS_OF_SERVICE_BUTTON}                        css=.fancybox-item.fancybox-close
${TERMS_OF_SERVICE_FRAME}                               css=div>iframe



*** Keywords ***
Accept Terms Of Service
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_CHECKBOX}
    Click Element  ${TERMS_OF_SERVICE_CHECKBOX}


Click 'Proceed To Checkout'
    Wait Until Element Is Visible  ${CHECKOUTSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}
    Click Element  ${CHECKOUTSHIPPING_PROCEED_TO_CHECKOUT_BUTTON}


Verify 'Terms Of Service' Error Popup Displayed
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_ERROR_MSG}
    Element Text Should Be  ${TERMS_OF_SERVICE_ERROR_MSG}  You must agree to the terms of service before continuing.


Close 'Terms Of Service' Error Popup
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_CLOSE_BUTTON}
    Click Link  ${TERMS_OF_SERVICE_CLOSE_BUTTON}


Click on 'Terms of service' link
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_LINK}
    Click Link  ${TERMS_OF_SERVICE_LINK}


Verify 'Terms of service' opened
    Wait Until Element Is Visible  ${TERMS_OF_SERVICE_FRAME}
    Select Frame  ${TERMS_OF_SERVICE_FRAME}
    Element Text Should Be  ${TERMS_OF_SERVICE_HEADER}  TERMS AND CONDITIONS OF USE
    Unselect Frame
    Wait Until Element Is Visible  ${CLOSE_TERMS_OF_SERVICE_BUTTON}
    Click Link  ${CLOSE_TERMS_OF_SERVICE_BUTTON}
    Wait Until Element Is Not Visible  ${TERMS_OF_SERVICE_FRAME}




