*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar no botao de Checkout
    [Documentation]    Clica no botão Checkout na página do carrinho.
    Click Button    id:checkout

Verificar se estou na pagina de informacoes do checkout
    [Documentation]    Verifica o título da primeira página do checkout.
    Wait Until Page Contains    Checkout: Your Information

Preencher informacoes do comprador
    [Arguments]    ${primeiro_nome}    ${ultimo_nome}    ${codigo_postal}
    Input Text    id:first-name      ${primeiro_nome}
    Input Text    id:last-name       ${ultimo_nome}
    Input Text    id:postal-code     ${codigo_postal}

Clicar no botao Continue
    Click Button    id:continue

Verificar se estou na pagina de resumo do pedido
    [Documentation]    Verifica o título da segunda página do checkout.
    Wait Until Page Contains    Checkout: Overview

Verificar resumo do pedido com a mochila
    [Documentation]    Verifica se o item e o preço total estão corretos na página de overview.
    # Verifica se o nome do produto está na página
    Page Should Contain    Sauce Labs Backpack
    # Verifica se o total (com taxas) está correto
    Element Text Should Be    class:summary_total_label    Total: $32.39

Clicar no botao Finish
    Click Button    id:finish

Verificar se a compra foi finalizada com sucesso
    [Documentation]    Verifica o cabeçalho e a mensagem da página de sucesso.
    Wait Until Page Contains Element    class:complete-header    timeout=10s
    Element Text Should Be              class:complete-header    Thank you for your order!