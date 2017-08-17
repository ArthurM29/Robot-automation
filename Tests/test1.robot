*** Settings ***
Resource  ../Resources/keywords.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
Templated Search
    [Template]  Search
    search_keyword1
    search_keyword2
    search_keyword3