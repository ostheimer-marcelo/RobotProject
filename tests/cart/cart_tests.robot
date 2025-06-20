*** Settings ***
Documentation       Testes para a página do carrinho de compras.
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot
Resource            ${EXECDIR}/resources/cart_resources.robot
Resource            ${EXECDIR}/resources/menu_resources.robot
Test Teardown       Close Browser

*** Test Cases ***
Verificar se item adicionado aparece corretamente no carrinho
    [Documentation]    Adiciona um item, navega para o carrinho e verifica os detalhes.
    [Tags]             Cart    Positive    Smoke
    Realizar Login e Adicionar Item ao Carrinho
    Navegar para a pagina do carrinho
    Verificar se a pagina do carrinho esta visivel
    Verificar se a mochila da Sauce Labs esta no carrinho

Remover um item de dentro do carrinho
    [Documentation]    Adiciona um item, vai para o carrinho e verifica a remoção.
    [Tags]             Cart    Positive    Regression
    Realizar Login e Adicionar Item ao Carrinho
    Navegar para a pagina do carrinho
    Verificar se a pagina do carrinho esta visivel
    Remover a mochila na pagina do carrinho
    Verificar se o carrinho de compras esta vazio

Navegar de volta para o inventario via botao "Continue Shopping"
    [Documentation]    Verifica se o botão 'Continue Shopping' redireciona.
    [Tags]             Cart    Navegacao    Positive    Regression
    Realizar Login Valido
    Navegar para a pagina do carrinho
    Verificar se a pagina do carrinho esta visivel
    Clicar no botao "Continue Shopping"
    Verificar se estou na pagina de inventario