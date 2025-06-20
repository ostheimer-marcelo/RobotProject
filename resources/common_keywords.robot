*** Settings ***
Library    SeleniumLibrary
Library    ../chrome_options_helper.py
# Adicionamos os imports para que a nova keyword possa chamar as outras
Resource   login_resources.robot
Resource   inventory_resources.robot

*** Keywords ***
Abrir a pagina de login do Sauce Demo
    [Documentation]    Abre o navegador usando as opções customizadas do nosso arquivo Python.

    # Passo 1: Chama a função do nosso arquivo .py para pegar as opções prontas.
    # O Robot transforma o nome da função get_chrome_options em "Get Chrome Options".
    ${chrome_options}=    Get Chrome Options

    # Passo 2: Abre o navegador passando as opções. Simples assim.
    Open Browser    https://www.saucedemo.com/    Chrome    options=${chrome_options}
    Page Should Contain Element    id:login-button

Realizar Login e Adicionar Item ao Carrinho
    [Documentation]    Keyword de setup completa que loga e adiciona um item ao carrinho.
    Realizar Login Valido
    Adicionar produto "Sauce Labs Backpack" ao carrinho