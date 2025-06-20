*** Settings ***
Documentation       Testes para as funcionalidades do menu lateral.
# Importamos TODAS as nossas caixas de ferramentas!
Resource            ${EXECDIR}/resources/common_keywords.robot
Resource            ${EXECDIR}/resources/login_resources.robot
Resource            ${EXECDIR}/resources/menu_resources.robot
Resource            ${EXECDIR}/resources/inventory_resources.robot

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

Verificar fechamento do menu lateral
    [Documentation]    Testa se o menu lateral é fechado ao clicar no botão 'X'.
    [Tags]             Menu    UI    Regression
    Clicar no menu hamburguer
    Clicar no botao de fechar o menu
    Verificar se o menu foi fechado

Resetar estado da aplicacao
    [Documentation]    Verifica se o botão 'Reset App State' limpa o carrinho de compras.
    [Tags]             Menu    Funcional    Regression

    # ETAPA 1 - PREPARAÇÃO: Mudar o estado da aplicação adicionando um item.
    # Note como usamos uma keyword de inventário em um teste de menu!
    Adicionar produto "Sauce Labs Backpack" ao carrinho
    Verificar se o icone do carrinho de compras foi atualizado

    # ETAPA 2 - AÇÃO: Executar a funcionalidade do menu que queremos testar.
    Clicar no menu hamburguer
    Clicar no link de Reset App State
    Clicar no botao de fechar o menu

    # ETAPA 3 - VERIFICAÇÃO: Checar se o estado foi revertido ao original.
    Verificar se o icone do carrinho de compras esta vazio