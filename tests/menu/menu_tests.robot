*** Settings ***
Documentation       Testes para as funcionalidades do menu lateral.
# Importamos TODAS as nossas caixas de ferramentas!
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/menu_resources.robot

# Para este teste, vamos logar antes (Setup) e fechar o navegador depois (Teardown)
Suite Setup         Realizar Login Valido
Suite Teardown      Close Browser


*** Test Cases ***
Logout de Usuario Valido
    [Documentation]    Verifica se o usuário consegue deslogar com sucesso.
    [Tags]             Menu    Logout    Smoke
    Clicar no menu hamburguer
    Clicar no link de Logout
    Verificar se estou de volta a pagina de login

Verificar link About do menu
    [Documentation]    Verifica se o link 'About' do menu redireciona para a página correta.
    [Tags]             Menu    Navegacao    Regression
    Clicar no menu hamburguer
    Clicar no link de About
    # Não trocamos de aba, pois a navegação ocorre na janela atual.
    Location Should Be    https://saucelabs.com/