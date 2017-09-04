*** Settings ***
Library  Selenium2Library
Resource            ../../resources/common.robot
Library  Dialogs


*** Variables ***
#string values
${FIVE_STAR_RATING_VALUE}           5
${REVIEW_TITLE_VALUE}               Cool Dress !
${REVIEW_CONTENT_VALUE}             I bought this dress for my wife, and she is very happy !
${PRODUCT_SIZE_VALUE}               S
${PRODUCT_QUANTITY_VALUE}           7


# locators
${PRODUCT_NAME}                     css=.pb-center-column.col-xs-12.col-sm-4>h1
${ADD_TO_CART_BUTTON}               name=Submit
${MORE_BUTTON}                      css=.button.lnk_view.btn.btn-default
${WRITE_REVIEW_BUTTON}              id=new_comment_tab_btn
${REVIEW_TITLE}                     id=comment_title
${FIVE_STAR_RATING}                 xpath=//div[@class='star_content']//a[@title='5']
${REVIEW_CONTENT}                   id=content
${SEND_REVIEW_BUTTON}               id=submitNewMessage
${REVIEW_CONFIRMATION_TEXT}         xpath=//div[@class='fancybox-inner']/p[1]
${REVIEW_CONFIRMATION_OK_BUTTON}    css=.button.btn-default.button-medium
${REVIEW_CONFIRMATION_POPUP}        css=.fancybox-inner
${SIZE_DROP_DOWN}                   id=group_1
${QUANTITY_FIELD}                   id=quantity_wanted
${QUANTITY_FIELD_VALUE}             xpath=//input[@id='quantity_wanted']@value
${QUANTITY_MINUS_ICON}              css=.icon-minus
${QUANTITY_PLUS_ICON}               css=.icon-plus



*** Keywords ***
Verify Page is Loaded for Product ${product}
    Wait Until Element Is Visible  ${PRODUCT_NAME}
    Element Text Should Be  ${PRODUCT_NAME}  ${product}


Add to Shopping Cart
    Click Button  ${ADD_TO_CART_BUTTON}


Click 'Write Review' Button
    Wait Until Element Is Visible  ${WRITE_REVIEW_BUTTON}
    Click Element  ${WRITE_REVIEW_BUTTON}


Select Star Rating
    [Arguments]  ${stars}
    Click Element  ${FIVE_STAR_RATING}


Enter Review Title
    [Arguments]  ${title}
    Wait Until Element Is Visible  ${REVIEW_TITLE}
    Input Text  ${REVIEW_TITLE}  ${title}


Enter Review Content
    [Arguments]  ${content}
    Input Text  ${REVIEW_CONTENT}  ${content}


Submit The Review
    Click Button  ${SEND_REVIEW_BUTTON}


Verify Review Submitted Successfully
    Wait Until Element Is Visible  ${REVIEW_CONFIRMATION_TEXT}
    Element Text Should Be  ${REVIEW_CONFIRMATION_TEXT}  Your comment has been added and will be available once approved by a moderator


Click 'Ok' On Review Confirmation Popup
    Click Button  ${REVIEW_CONFIRMATION_OK_BUTTON}
    Element Should Not Be Visible  ${REVIEW_CONFIRMATION_POPUP}


Choose A Size
    [Arguments]  ${size}
    Select From List By Label  ${SIZE_DROP_DOWN}  ${size}


Verify Selected Size
    [Arguments]  ${size}
    Element Text Should Be  xpath=//select[@id='group_1']/option[text()='${size}']  ${size}


Enter Quantity Value
    [Arguments]  ${quantity}
    Input Text  ${QUANTITY_FIELD}  ${quantity}


Increase Quantity By One
    Click Button  ${QUANTITY_PLUS_ICON}


Decrease Quantity By One
    Click Button  ${QUANTITY_MINUS_ICON}


Verify Entered Quantity
    [Arguments]  ${quantity}
    ${actual_quantity}=  Get Element Attribute  ${QUANTITY_FIELD_VALUE}
    Should Be Equal As Strings  ${actual_quantity}  ${quantity}
    sleep  4