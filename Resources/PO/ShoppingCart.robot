*** Settings ***
Library  Selenium2Library
Resource            ../../Resources/Common.robot


*** Variables ***



*** Keywords ***
Verify Item Is Added To Shopping Cart
    Element Text Should Be  xpatch=.//*[@id='layer_cart']/div[1]/div[1]/h2/i  Product successfully added to your shopping cart


