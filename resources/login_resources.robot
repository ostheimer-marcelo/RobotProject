*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Preencher as credenciais de usuario e senha
    [Arguments]    ${username}    ${password}
    Input Text      id:user-name      ${username}
    Input Password    id:password     ${password}

Clicar no botao de login
    Click Button    id:login-button

Verificar se o login foi bem-sucedido
    Wait Until Page Contains Element    class:inventory_list    timeout=5s
    Location Should Be                  https://www.saucedemo.com/inventory.html

Verificar mensagem de erro para credenciais invalidas
    [Documentation]    Verifica se a mensagem de erro correta é exibida.

    Wait Until Page Contains Element    css:h3[data-test="error"]    timeout=5s
    Element Should Contain              css:h3[data-test="error"]    Username and password do not match any user in this service

Verificar mensagem de erro especifica
    [Arguments]    ${mensagem_esperada}
    Wait Until Page Contains Element    css:h3[data-test="error"]    timeout=5s
    Element Should Contain              css:h3[data-test="error"]    ${mensagem_esperada}