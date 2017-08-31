*** Settings ***
Resource            ../Resources/Common.robot
Resource            ../Resources/PO/SearchResults.robot
Resource            ../Resources/PO/AddToCart.robot
Resource            ../Resources/PO/ProductDetails.robot
Resource            ../Resources/search_keywords.robot
Resource            ../Resources/gherkin.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test


*** Test Cases ***
Logged out user is able to search a product
    Given user is not logged in the application
    When user searches for product  Blouse
    Then the product is present in search results  Blouse


Logged out user is able to add product to shopping cart
    Given user is not logged in the application
    When user searches for product  dress
    And user adds the product to Shopping Cart  Blouse
    Then the product is present in Shopping Cart  Blouse






#User is able to add product to Shopping Cart
#    Given user searches for product  Blouse
#    And user proceeds to view Product Details  Blouse
#    And user adds the product to Shopping Cart  Blouse
#    Then the product is present in Shopping Cart  Blouse


#User is able to remove product from Shopping Cart
#    Given user searches for product  Blouse
#    And user proceeds to view Product Details  Blouse
#    And user adds the product to Shopping Cart  Blouse
#    When User Removes The Product From Shopping Cart  Blouse
#    sleep  2
#    Then the product is not present in Shopping Cart  Blouse

