*** Settings ***
Library  Selenium2Library

*** Keywords ***

# print to console
Log To Console  Hello

# print new line
Log To Console  ${\n}

# Get attribute of an element and compare 2 strings
${title}=  Get Element Attribute  xpath=//a[@class='product_img_link']/img@title
Should Be Equal As Strings  ${title}  Blouse

# data driven testing with templates
Templated Search
    [Template]  Search
    search_keyword1
    search_keyword2
    search_keyword3


# 10 spaces
${SPACE * 10}


# Concatenate 2 strings
${search_keyword}=  Catenate  Hello world


# check if element is visible or not
${present}=  Run Keyword And Return Status    Element Should Not Be Visible   locator
Log To Console  ${present}


# execute javascript, passing css selector
Execute Javascript  document.querySelector(".step_current.third>span").click();

# find xpath

# by attribute
xpath=//div[@class='product-name']

# by text value
a[text()='${product}']

# by parent
parent::div/parent::div

# by sibling
following-sibling::span/a


# locating element:   # p class="cart_block_no_products unvisible"

# starts-with
xpath:  //a[starts-with(@class,'block')]
css:    a[class^="blockbestsellers"]

# ends-with
xpath:  //a[ends-with(@class,'block')]   # only in XPATH 2.0 = not available for Selenium
css:    a[class$="sellers"]

# contains
xpath:  //a[contains(@class,'best')]
css:    a[class*="best"]

# locating element:   <h1>Automation Practice Website</h1>
xpath:   //div/h1[contains(text(),'Practice')]
