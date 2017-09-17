*** Settings ***
Resource            ../resources/common.robot
Resource            ../resources/keywords/gherkin.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
User is able to search a product
    Given user is not logged in the application
    When user searches for product  Blouse
    Then the product is present in search results  Blouse


User is able to add product to Shopping Cart
    Given user searches for product  Blouse
    And user proceeds to view Product Details  Blouse
    And user adds the product to Shopping Cart  Blouse
    Then the product is present in Shopping Cart  Blouse




