*** Settings ***
Documentation       Testes para a página de inventário de produtos.
# Importamos as ferramentas comuns e as novas ferramentas de inventário
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot
# E também as ferramentas de login, pois nosso Setup depende delas!
Resource            ${EXECDIR}/resources/login_resources.robot

# Reutilizamos nosso Suite Setup para já começar o teste logado!
Suite Setup         Realizar Login Valido
Suite Teardown      Close Browser

*** Test Cases ***
Adicionar um item especifico ao carrinho
    [Documentation]    Verifica se o usuário consegue adicionar a mochila
    ...                Sauce Labs ao carrinho de compras com sucesso.
    [Tags]             Inventory    Positive    Smoke

    Verificar se estou na pagina de inventario
    Adicionar produto "Sauce Labs Backpack" ao carrinho
    Verificar se o icone do carrinho de compras foi atualizado

Remover um item pela pagina de inventario
    [Documentation]    Verifica a funcionalidade de remover um item
    ...                diretamente da página de inventário.
    [Tags]             Inventory    Positive

    # Etapa 1: Preparar o cenário (adicionar o item primeiro)
    Adicionar produto "Sauce Labs Backpack" ao carrinho
    Verificar se o botao do produto "Sauce Labs Backpack" virou "Remove"

    # Etapa 2: Ação principal do teste
    Remover produto "Sauce Labs Backpack" do carrinho

    # Etapa 3: Verificação final
    Verificar se o icone do carrinho de compras esta vazio
    # Como verificação extra, podemos garantir que o botão "Add to cart" original reapareceu
    Wait Until Page Contains Element    css:button[data-test="add-to-cart-sauce-labs-backpack"]    timeout=5s