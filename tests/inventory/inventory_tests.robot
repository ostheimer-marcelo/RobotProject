*** Settings ***
Documentation       Testes para a página de inventário de produtos.
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/menu_resources.robot
Test Teardown       Close Browser

*** Test Cases ***
Adicionar um item especifico ao carrinho
    [Documentation]    Verifica se o usuário consegue adicionar a mochila ao carrinho.
    [Tags]             Inventory    Positive    Smoke
    Realizar Login Valido
    Verificar se estou na pagina de inventario
    Adicionar produto "Sauce Labs Backpack" ao carrinho
    Verificar se o icone do carrinho de compras foi atualizado

Remover um item pela pagina de inventario
    [Documentation]    Verifica a funcionalidade de remover um item.
    [Tags]             Inventory    Positive
    Realizar Login e Adicionar Item ao Carrinho
    Verificar se o botao do produto "Sauce Labs Backpack" virou "Remove"
    Remover produto "Sauce Labs Backpack" do carrinho
    Verificar se o icone do carrinho de compras esta vazio
    Wait Until Page Contains Element    css:button[data-test="add-to-cart-sauce-labs-backpack"]    timeout=5s

Ordenar produtos por preco crescente
    [Documentation]    Verifica se a ordenação de produtos por preço funciona.
    [Tags]             Inventory    Sorting    Regression
    Realizar Login Valido
    Verificar se estou na pagina de inventario
    Ordenar produtos por "Preco (crescente)"
    Verificar se os produtos estao ordenados por preco crescente