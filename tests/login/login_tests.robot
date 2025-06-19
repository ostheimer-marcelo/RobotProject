*** Settings ***
Documentation       Testes de Login para o site Sauce Demo.
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/common_keywords.robot
Test Teardown       Close Browser

*** Variables ***
${VALID_USER}       standard_user
${INVALID_USER}     usuario_invalido
${VALID_PASSWORD}   secret_sauce
${INVALID_PASSWORD}  senha_invalida

*** Test Cases ***
Login com Credenciais Validas
    [Documentation]    Este teste verifica o fluxo de login bem-sucedido.
    [Tags]             Login    Positivo    Smoke
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    ${VALID_USER}    ${VALID_PASSWORD}
    Clicar no botao de login
    Verificar se o login foi bem-sucedido

Login com Username Invalido
    [Documentation]    Este teste verifica a mensagem de erro com um usuário inválido.
    [Tags]             Login    Negativo    Regression
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    ${INVALID_USER}    ${VALID_PASSWORD}
    Clicar no botao de login
    Verificar mensagem de erro para credenciais invalidas

Login com Senha Invalida
    [Documentation]    Este teste verifica a mensagem de erro com uma senha inválida.
    [Tags]             Login    Negativo    Regression
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    ${VALID_USER}    ${INVALID_PASSWORD}
    Clicar no botao de login
    Verificar mensagem de erro para credenciais invalidas

Login com Campos Vazios
    [Documentation]    Este teste clica em login sem preencher nenhum campo
    ...                e verifica a mensagem de erro de usuário obrigatório.
    [Tags]             Login    Negativo    Regression
    Abrir a pagina de login do Sauce Demo
    Clicar no botao de login
    Verificar mensagem de erro especifica    Epic sadface: Username is required

Login com Username Vazio
    [Documentation]    Este teste verifica a mensagem de erro ao tentar logar com o username em branco.
    [Tags]             Login    Negativo    Regression
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    ${EMPTY}    ${VALID_PASSWORD}
    Clicar no botao de login
    Verificar mensagem de erro especifica    Epic sadface: Username is required

Login com Senha Vazia
    [Documentation]    Este teste verifica a mensagem de erro ao tentar logar com a senha em branco.
    [Tags]             Login    Negativo    Regression
    Abrir a pagina de login do Sauce Demo
    Preencher as credenciais de usuario e senha    ${VALID_USER}    ${EMPTY}
    Clicar no botao de login
    Verificar mensagem de erro especifica    Epic sadface: Password is required