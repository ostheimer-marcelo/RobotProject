*** Settings ***
Documentation       Testes para o fluxo de checkout.
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot
Resource            ${EXECDIR}/resources/cart_resources.robot
Resource            ${EXECDIR}/resources/checkout_resources.robot
Test Teardown       Close Browser

*** Test Cases ***
Preencher informacoes do comprador com sucesso
    [Documentation]    Valida a primeira etapa do fluxo de checkout.
    [Tags]             Checkout    Positive    Smoke
    Realizar Login e Adicionar Item ao Carrinho
    Navegar para a pagina do carrinho
    Clicar no botao de Checkout
    Verificar se estou na pagina de informacoes do checkout
    Preencher informacoes do comprador    Marcelo    Ostheimer    12345-678
    Clicar no botao Continue
    Verificar se estou na pagina de resumo do pedido

Realizar compra de um item com sucesso
    [Documentation]    Valida o fluxo de compra de ponta a ponta.
    [Tags]             Checkout    Positive    Smoke    E2E
    Realizar Login e Adicionar Item ao Carrinho
    Navegar para a pagina do carrinho
    Clicar no botao de Checkout
    Verificar se estou na pagina de informacoes do checkout
    Preencher informacoes do comprador    Marcelo    Ostheimer    12345-678
    Clicar no botao Continue
    Verificar se estou na pagina de resumo do pedido
    Verificar resumo do pedido com a mochila
    Clicar no botao Finish
    Verificar se a compra foi finalizada com sucesso