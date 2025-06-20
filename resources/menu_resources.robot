*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar no menu hamburguer
    Click Button    id:react-burger-menu-btn

Clicar no link de Logout
    # Primeiro, esperamos o link ficar visível, pois o menu tem uma animação.
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=5s
    Click Element                    id:logout_sidebar_link

Verificar se estou de volta a pagina de login
    # A melhor forma de saber que o logout funcionou é verificar se o botão de login está na tela.
    Wait Until Page Contains Element    id:login-button    timeout=5s
    Page Should Not Contain Element     class:inventory_list

Verificar se o link de About esta correto
    [Documentation]    Verifica se o link 'About' existe e aponta para a URL correta.
    Wait Until Element Is Visible    id:about_sidebar_link    timeout=5s
    # Passo 1: Pega o valor do atributo 'href' do link.
    ${href}=    Get Element Attribute    id:about_sidebar_link    href
    # Passo 2: Compara se o valor é exatamente o que esperamos.
    Should Be Equal    ${href}    https://saucelabs.com/

Clicar no botao de fechar o menu
    [Documentation]    Espera o botão 'X' do menu ficar pronto e então o clica.

    # Adicionamos esperas para garantir que a animação do menu terminou.
    Wait Until Element Is Visible    id=react-burger-cross-btn    timeout=5s
    Wait Until Element Is Enabled    id=react-burger-cross-btn    timeout=5s

    # Só depois que o botão está visível e habilitado, nós clicamos.
    Click Button                     id=react-burger-cross-btn

Verificar se o menu foi fechado
    [Documentation]    Espera dinamicamente até que o link de logout
    ...                desapareça, confirmando que o menu foi fechado.
    Wait Until Element Is Not Visible    id=logout_sidebar_link    timeout=10s

Clicar no link de Reset App State
    [Documentation]    Clica no link 'Reset App State' no menu lateral.
    Wait Until Element Is Visible    id:reset_sidebar_link    timeout=5s
    Click Element                    id:reset_sidebar_link

Resetar o estado da aplicacao pelo menu
    [Documentation]    Abre o menu, clica em reset e fecha o menu.
    Clicar no menu hamburguer
    Clicar no link de Reset App State
    Clicar no botao de fechar o menu