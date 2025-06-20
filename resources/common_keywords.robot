*** Settings ***
Library    SeleniumLibrary
Library    ../chrome_options_helper.py
# Importamos nosso novo arquivo de variáveis globais
Resource  ./environment_variables.robot
# Mantemos os outros imports que já estavam aqui
Resource   login_resources.robot
Resource   inventory_resources.robot

*** Keywords ***
Abrir a pagina de login do Sauce Demo
    [Documentation]    Abre o navegador (Chrome, Firefox, Edge) e aplica
    ...                opções específicas do Chrome se necessário.

    # LÓGICA CONDICIONAL: SE o navegador for Chrome, use as opções. SENÃO, não use.
    IF    '${BROWSER}' == 'Chrome'
        ${chrome_options}=    Get Chrome Options
        Open Browser    ${URL}    browser=${BROWSER}    options=${chrome_options}
    ELSE
        Open Browser    ${URL}    browser=${BROWSER}
    END

    Maximize Browser Window
    Page Should Contain Element    id:login-button

# A outra keyword continua igual.
Realizar Login e Adicionar Item ao Carrinho
    [Documentation]    Keyword de setup completa que loga e adiciona um item ao carrinho.
    Realizar Login Valido
    Adicionar produto "Sauce Labs Backpack" ao carrinho