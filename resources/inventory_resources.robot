*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Keywords ***
Verificar se estou na pagina de inventario
    [Documentation]    Verifica se o título "Products" está visível na página.
    Wait Until Page Contains    Products    timeout=10s

Adicionar produto "Sauce Labs Backpack" ao carrinho
    [Documentation]    Encontra o botão específico da mochila e o clica.
    # Os desenvolvedores deste site nos deram um 'data-test' ID para cada botão,
    # o que torna nosso seletor muito mais robusto e fácil!
    Click Button    css:button[data-test="add-to-cart-sauce-labs-backpack"]

Verificar se o icone do carrinho de compras foi atualizado
    [Documentation]    Verifica se o número '1' aparece no ícone do carrinho.
    Element Text Should Be    class:shopping_cart_badge    1

Remover produto "Sauce Labs Backpack" do carrinho
    [Documentation]    Clica no botão 'Remove' específico da mochila.
    # O botão de remover também tem um seletor de teste específico!
    Click Button    css:button[data-test="remove-sauce-labs-backpack"]

Verificar se o botao do produto "Sauce Labs Backpack" virou "Remove"
    [Documentation]    Verifica se o botão da mochila agora exibe 'Remove'.
    # Esperamos o botão de remover aparecer...
    Wait Until Page Contains Element    css:button[data-test="remove-sauce-labs-backpack"]    timeout=5s
    # E verificamos se o texto dele é "Remove".
    Element Text Should Be              css:button[data-test="remove-sauce-labs-backpack"]    Remove

Verificar se o icone do carrinho de compras esta vazio
    [Documentation]    Verifica se o contador de itens do carrinho não está visível.
    # Quando o carrinho está vazio, o elemento do contador desaparece.
    # Reutilizamos a lógica que aprendemos no teste do menu!
    Element Should Not Be Visible    class:shopping_cart_badge

Ordenar produtos por "Preco (crescente)"
    [Documentation]    Seleciona a opção 'Price (low to high)' no dropdown.
    # O seletor do dropdown é 'product_sort_container'.
    # A opção que queremos tem o 'value' HTML de 'lohi'.
    Select From List By Value    class:product_sort_container    lohi
    # Adicionamos uma pequena pausa para a interface reordenar os itens.
    Sleep    1s

Verificar se os produtos estao ordenados por preco crescente
    [Documentation]    Captura todos os preços, os converte para números e verifica se a lista está ordenada.
    # Passo 1: Pegar todos os elementos que contêm os preços.
    ${elementos_de_preco}=    Get WebElements    class:inventory_item_price

    # Passo 2: Criar uma lista vazia para guardar os preços como números.
    @{lista_de_precos}=    Create List

    # Passo 3: Loop para processar cada elemento de preço.
    FOR    ${elemento}    IN    @{elementos_de_preco}
        # Pega o texto do elemento (ex: "$29.99")
        ${preco_texto}=    Get Text    ${elemento}
        # Remove o cifrão "$" do texto
        ${preco_sem_cifrao}=    Remove String    ${preco_texto}    $
        # Converte o texto "29.99" para um número
        ${preco_numero}=    Convert To Number    ${preco_sem_cifrao}
        # Adiciona o número à nossa lista
        Append To List    ${lista_de_precos}    ${preco_numero}
    END

    # Passo 4: Fazer uma cópia da nossa lista de preços e ordená-la.
    @{lista_ordenada}=    Copy List    ${lista_de_precos}
    Sort List    ${lista_ordenada}

    # Passo 5: A verificação final! Comparamos se a lista original (da página)
    # é idêntica à nossa cópia que ordenamos. Se forem, o teste passa.
    Lists Should Be Equal    ${lista_de_precos}    ${lista_ordenada}
