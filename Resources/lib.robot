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