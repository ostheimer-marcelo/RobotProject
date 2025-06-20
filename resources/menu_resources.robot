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

Clicar no link de About
    [Documentation]    Clica no link 'About' usando um clique de JavaScript.
    ...                Esta abordagem é usada porque o clique padrão do Selenium
    ...                não estava funcionando de forma consistente para este elemento.

    Wait Until Element Is Visible    id:about_sidebar_link    timeout=5s
    Wait Until Element Is Enabled    id:about_sidebar_link    timeout=5s

    ${about_link}=    Get WebElement    id:about_sidebar_link
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${about_link}

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