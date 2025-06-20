*** Settings ***
Library    SeleniumLibrary

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