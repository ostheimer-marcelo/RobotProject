*** Settings ***
Library    SeleniumLibrary
Resource   common_keywords.robot

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

Verificar mensagem de erro especifica
    [Arguments]    ${mensagem_esperada}
    [Documentation]    Captura o texto do elemento de erro e verifica se ele
    ...                contém o texto esperado.

    Wait Until Page Contains Element    css:h3[data-test="error"]    timeout=5s

    ${texto_real_da_pagina}=    Get Text    css:h3[data-test="error"]

    Should Contain    ${texto_real_da_pagina}    ${mensagem_esperada}

Realizar Login Valido
    [Documentation]    Executa o fluxo completo de login com um usuário padrão.
    ...                Usado como uma precondição (Setup) para suítes de teste
    ...                que requerem um usuário autenticado.
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    standard_user    secret_sauce
    Clicar no botao de login
    Verificar se o login foi bem-sucedido