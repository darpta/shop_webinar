*** Settings ***
Documentation       Automated tests for shopping cart functionality
Library             SeleniumLibrary
Suite Setup         Prepare Env

*** Variables ***
${CART_ITEMS_AMOUNT}     //*[@id="header"]/div[3]/div/div/div[3]/div/a

*** Test Cases ***
Adding Product To Shopping Cart Should Increase Products Amount
    [Setup]     Open Shop Webpage
    Check If Shopping Cart Is Empty
#    Go To product View
#    Add Product To Shopping Cart
#    Check If Shopping Cart Has 1 Product
    [Teardown]  Close Browser

*** Keywords ***
Prepare Env
    Set Selenium Speed      0.5
    set screenshot directory        screenshots

Open Shop Webpage
    open browser    http://automationpractice.com/index.php   chrome
    Maximize Browser Window

Check If Shopping Cart Is Empty
    Wait Until Element Contains      ${CART_ITEMS_AMOUNT}        (empty)