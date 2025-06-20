*** Settings ***
Documentation       Testes para as funcionalidades do menu lateral.
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot
Resource            ${EXECDIR}/resources/menu_resources.robot
Test Teardown       Close Browser

*** Test Cases ***
Logout de Usuario Valido
    [Documentation]    Verifica se o usuário consegue deslogar com sucesso.
    [Tags]             Menu    Logout    Smoke
    Realizar Login Valido
    Clicar no menu hamburguer
    Clicar no link de Logout
    Verificar se estou de volta a pagina de login

Verificar link About do menu
    [Documentation]    Verifica se o link 'About' do menu redireciona para a página correta.
    [Tags]             Menu    Navegacao    Regression
    Realizar Login Valido
    Clicar no menu hamburguer
    Clicar no link de About
    Location Should Be    https://saucelabs.com/

Verificar fechamento do menu lateral
    [Documentation]    Testa se o menu lateral é fechado ao clicar no botão 'X'.
    [Tags]             Menu    UI    Regression
    Realizar Login Valido
    Clicar no menu hamburguer
    Clicar no botao de fechar o menu
    Verificar se o menu foi fechado

Resetar estado da aplicacao
    [Documentation]    Verifica se o botão 'Reset App State' limpa o carrinho de compras.
    [Tags]             Menu    Funcional    Regression
    Realizar Login e Adicionar Item ao Carrinho
    Clicar no menu hamburguer
    Clicar no link de Reset App State
    Clicar no botao de fechar o menu
    Verificar se o icone do carrinho de compras esta vazio