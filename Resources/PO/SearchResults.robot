*** Settings ***
Library  Selenium2Library
Resource            ../../Resources/Common.robot


*** Variables ***
${PRODUCT_IMAGE}        css=.product_img_link>img


*** Keywords ***
Click 'Add to cart' link
    Click Element  css=.product_img_link>img




