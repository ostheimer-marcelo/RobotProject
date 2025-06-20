*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Navegar para a pagina do carrinho
    [Documentation]    Clica no ícone do carrinho de compras.
    Click Element    class:shopping_cart_link

Verificar se a pagina do carrinho esta visivel
    [Documentation]    Verifica se o título "Your Cart" está na página.
    Wait Until Page Contains    Your Cart    timeout=5s

Verificar se a mochila da Sauce Labs esta no carrinho
    [Documentation]    Verifica todos os detalhes de um item específico no carrinho.
    # Este é um seletor XPath mais avançado. Ele encontra o item do carrinho
    # que contém o texto "Sauce Labs Backpack".
    ${xpath_linha_produto}=    Set Variable    //div[@class='cart_item' and .//div[text()='Sauce Labs Backpack']]

    # Verificamos se o item está visível
    Element Should Be Visible    ${xpath_linha_produto}
    # Verificamos se a quantidade é 1
    Element Text Should Be       ${xpath_linha_produto}//div[@class='cart_quantity']      1
    # Verificamos se o preço está correto
    Element Text Should Be       ${xpath_linha_produto}//div[@class='inventory_item_price']    $29.99

Remover a mochila na pagina do carrinho
    [Documentation]    Clica no botão 'Remove' da mochila na página do carrinho.
    # O seletor é o mesmo da página de inventário, o que facilita!
    Click Button    css:button[data-test="remove-sauce-labs-backpack"]

Verificar se o carrinho de compras esta vazio
    [Documentation]    Verifica se não há nenhum item listado no carrinho.
    # Adicionamos uma pausa para a remoção via JavaScript acontecer.
    Sleep    1s
    # Se o carrinho está vazio, o elemento com a classe 'cart_item' não deve existir.
    Page Should Not Contain Element    class:cart_item

Clicar no botao "Continue Shopping"
    [Documentation]    Clica no botão para voltar à página de inventário.
    # O seletor deste botão é id=continue-shopping
    Click Button    id:continue-shopping