*** Settings ***
Resource            view_product_kw.robot
Resource            ../page-objects/MyAddresses.robot
Resource            ../page-objects/AddToCart.robot
Resource            ../page-objects/order/CheckoutSummary.robot
Resource            ../page-objects/order/CheckoutSignIn.robot
Resource            ../page-objects/order/CheckoutAddress.robot
Resource            ../page-objects/order/CheckoutShipping.robot
Resource            ../page-objects/order/CheckoutPayment.robot




*** Keywords ***
Enter Product Quantity
    [Arguments]  ${quantity}
    ProductDetails.Enter Quantity Value  ${quantity}


Proceed to Order Checkout
    AddToCart.Click 'Proceed To Checkout'


Checkout The Order
    CheckoutSummary.Click 'Proceed To Checkout'
    CheckoutAddress.Click 'Proceed To Checkout'
    CheckoutShipping.Accept Terms Of Service
    CheckoutShipping.Click 'Proceed To Checkout'
    CheckoutPayment.Click On 'Pay by bank wire' Payment Method
    CheckoutPayment.Click 'Proceed To Checkout'


Checkout The Order From Address
    CheckoutAddress.Click 'Proceed To Checkout'
    CheckoutShipping.Accept Terms Of Service
    CheckoutShipping.Click 'Proceed To Checkout'
    CheckoutPayment.Click On 'Pay by bank wire' Payment Method
    CheckoutPayment.Click 'Proceed To Checkout'


Checkout The Order and Do Not Accept 'Terms of service'
    CheckoutSummary.Click 'Proceed To Checkout'
    CheckoutAddress.Click 'Proceed To Checkout'
    # Do Not accept terms of use
    CheckoutShipping.Click 'Proceed To Checkout'


Proceed to 'Order Shipping'
    CheckoutSummary.Click 'Proceed To Checkout'
    CheckoutAddress.Click 'Proceed To Checkout'


Proceed to 'Order Address'
    CheckoutSummary.Click 'Proceed To Checkout'


Proceed to 'Order Payment'
    CheckoutSummary.Click 'Proceed To Checkout'
    CheckoutAddress.Click 'Proceed To Checkout'
    CheckoutShipping.Accept Terms Of Service
    CheckoutShipping.Click 'Proceed To Checkout'


Verify Order Checkout Completed Successfully
    CheckoutPayment.Verify Confirmation Text Displayed


Verify User Is Not Allowed To Proceed To Payment
    CheckoutShipping.Verify 'Terms Of Service' Error Popup Displayed
    CheckoutShipping.Close 'Terms Of Service' Error Popup


Add Product to Shopping Cart
    ProductDetails.Add to Shopping Cart
    AddToCart.Verify 'Added to Cart' message


Verify 'Added to Cart' Confirmation Message
    AddToCart.Verify 'Added to Cart' message


Add Product to Shopping Cart from 'Quick View'
    Proceed To 'Quick View'
    ProductQuickView.Click 'Add to Cart' Button


Add Product to Shopping Cart from 'Search results'
    SearchResults.Click 'Add to Cart' Button


Verify Product Is In Shopping Cart
    [Arguments]  ${prod}
    ${products_in_cart} =  CheckoutSummary.Get Products In Shopping Cart
    Webelements Should Contain Text  ${products_in_cart}  ${prod}


Verify Product Is Not In Shopping Cart
    [Arguments]  ${prod}
    ${products_in_cart} =  CheckoutSummary.Get Products In Shopping Cart
    # if cart is empty, Pass with message 'Shopping Cart is empty'
    Run Keyword If  '${products_in_cart}' == 'None'  Pass Execution  Shopping Cart is empty
    # if cart not empty, check if it contains ${prod}
    ...  ELSE  Webelements Should Not Contain Text  ${products_in_cart}  ${prod}


Remove Product From Shopping Cart
    [Arguments]  ${product}
    CheckoutSummary.Click 'Delete' icon  ${product}


Open 'Terms of service'
    CheckoutShipping.Click on 'Terms of service' link


Verify 'Terms of service' is opened successfully
    CheckoutShipping.Verify 'Terms of service' opened


Verify Product Quantity Is
    [Arguments]  ${quantity}
    CheckoutPayment.Product Quantity Should Be  ${quantity}


Increase Quantity By One
    ProductDetails.Click Quantity 'Plus' icon


Decrease Quantity By One
    ProductDetails.Click Quantity 'Minus' icon


Select Product Size
    [Arguments]  ${size}
    ProductDetails.Select Size Value  ${size}


Verify Product Size Is
    [Arguments]  ${size}
    CheckoutPayment.Product Size Should Be  ${size}


Select Product Colour
    [Arguments]  ${colour}
    ProductDetails.Select Colour Value  ${colour}


Verify Product Colour Is
    [Arguments]  ${colour}
    CheckoutPayment.Product Colour Should Be  ${colour}


Select 'Pay by bank wire' Payment Method
    CheckoutPayment.Click on 'Pay by bank wire' Payment Method


Select 'Pay by check' Payment Method
    CheckoutPayment.Click on 'Pay by check' Payment Method


Verify Payment Method Is
    [Arguments]  ${payment_method}
    CheckoutPayment.Payment Method Should Be  ${payment_method}


Verify Product Price Is
    [Arguments]  ${price}
    CheckoutPayment.Product Price Should Be  ${price}


Verify Total Price Is
    [Arguments]  ${price}
    CheckoutPayment.Total Price Should Be  ${price}


Delete Shipping Address
    [Arguments]  ${address}
    MyAddresses.Remove Shipping Address  ${address}


Delete All Shipping Addresses
    Wait Until Element Is Visible  ${ADDRESSES_SECTION}
    ${elem} =  Get Matching Xpath Count  ${NO_ADDRESS_LABEL}
    Run Keyword If  ${elem} == 0  MyAddresses.Remove All Shipping Addresses
    ...  ELSE  Log  No Shipping Address is available


Verify Shipping Address Is Deleted
    [Arguments]  ${address}
    MyAddresses.Address Should Be Deleted  ${address}


Create A Shipping Address
    [Arguments]  ${title}
    MyAddresses.Click 'Add a new address Button'
    MyAddresses.Populate Shipping Address Fields and Submit  ${title}


Enter Shipping Address Values and Submit
    [Arguments]  ${title}
    MyAddresses.Populate Shipping Address Fields and Submit  ${title}


Go To 'My Addresses'
    MyAccount.Open 'My Addresses'


Proceed To 'My Account'
    TopNav.Go To 'My Account'


Verify Shipping Address Is Created
    [Arguments]  ${title}
    MyAddresses.Shipping Address Should Be Created  ${title}


Select Shipping Address
    [Arguments]  ${address}
    MyAddresses.Select Address From Drop-down  ${address}


Verify Shipping Address Is Selected
    [Arguments]  ${address}
    MyAddresses.Address Should Be Selected  ${address}


User Is Prompted to Sign In
    CheckoutSignIn.Page Heading Should Be


Sign In and Proceed to 'Checkout Address'
    CheckoutSignIn.Sign In and Navigate To 'Checkout Address'  ${VALID_EMAIL}  ${VALID_PASSWORD}


Search and Add To Shopping Cart
    [Arguments]  ${product}
    Search  ${product}
    Proceed to 'Product Details'
    Add To Shopping Cart
    AddToCart.Click 'Close' button


Verify Product Total Price is Calculated Correctly
    [Arguments]  ${product}
    ${unit_price} =  CheckoutPayment.Get Unit Price for Product  ${product}
    ${quantity} =  CheckoutPayment.Get Quantity for Product  ${product}
    ${actual_total_price} =  CheckoutPayment.Get Total Price for Product  ${product}
    ${expected_total_price} =  Evaluate  ${unit_price} * ${quantity}
    Should Be Equal As Numbers  ${expected_total_price}  ${actual_total_price}


Verify Order Total Price is Calculated Correctly
    ${total_products_price} =  CheckoutPayment.Get Total Products Price
    ${total_shipping_price} =  CheckoutPayment.Get Total Shipping Price
    ${expected_order_total_price} =  CheckoutPayment.Get Order Total Price
    ${actual_order_total_price} =  Evaluate  ${total_products_price} + ${total_shipping_price}
    Should Be Equal As Numbers  ${expected_order_total_price}  ${actual_order_total_price}