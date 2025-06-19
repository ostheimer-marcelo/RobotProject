*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir a pagina de login do Sauce Demo
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Page Should Contain Element    id:login-button