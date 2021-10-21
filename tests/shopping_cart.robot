*** Settings ***
Documentation       Automated tests for shopping cart functionality
Library             SeleniumLibrary
Suite Setup         Prepare Env

*** Variables ***
${BROWSER}                  chrome
${URL}                      https://mystore-testlab.coderslab.pl/index.php
${CART_ITEMS_AMOUNT_0}      //span[contains(text(),'(0)')]
${CART_ITEMS_AMOUNT_1}      //span[contains(text(),'(1)')]
${PRODUCT_VIEW}             //a[contains(text(),'Hummingbird printed sweater')]
${ADD_TO_CART_BUTTON}       //body/main[1]/section[1]/div[1]/div[1]/section[1]/div[1]/div[2]/div[2]/div[2]/form[1]/div[2]/div[1]/div[2]/button[1]
${PROCEED_TO_CHECKOUT}      //body/div[@id='blockcart-modal']/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/a[1]

*** Test Cases ***
Adding Product To Shopping Cart Should Increase Products Amount
    [Setup]     Open Shop Webpage
    Check If Shopping Cart Has 0 Products
    Go To product View
    Add Product To Shopping Cart
    Check If Shopping Cart Has 1 Products
    [Teardown]  Close Browser

*** Keywords ***
Prepare Env
    Set Selenium Speed      0.5
    set screenshot directory        screenshots

Open Shop Webpage
    open browser        ${URL}      ${BROWSER}
    Maximize Browser Window

Check If Shopping Cart Has 0 Products
    #${expected_text}                    Set Variable If             '${amount}' > '0'
    #...                                 (${amount})
    #...                                 (0)
    #Wait Until Element Contains         ${CART_ITEMS_AMOUNT_1}        #${expected_text}
    Wait Until Element Contains         ${CART_ITEMS_AMOUNT_0}        (0)

Check If Shopping Cart Has 1 Products
    Wait Until Element Contains         ${CART_ITEMS_AMOUNT_1}        (1)

Go To Product View
    click element                       ${PRODUCT_VIEW}

Add Product To Shopping Cart
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}       timeout=2s
    click element                       ${ADD_TO_CART_BUTTON}
    #Wait Until Page Contains Element    ${PROCEED_TO_CHECKOUT}      timeout=2s
    #click element                       ${PROCEED_TO_CHECKOUT}

