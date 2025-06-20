# Projeto de Automação de Testes Web com Robot Framework 🤖

![Status](https://img.shields.io/badge/status-concluído-brightgreen)
![Framework](https://img.shields.io/badge/framework-Robot%20Framework-blue)
![Linguagem](https://img.shields.io/badge/linguagem-Python-yellow)
![Biblioteca](https://img.shields.io/badge/biblioteca-SeleniumLibrary-orange)

## 📖 Sobre o Projeto

Este projeto foi desenvolvido como um portfólio de automação de testes, demonstrando a aplicação de boas práticas e padrões de arquitetura para testar uma aplicação web de e-commerce do início ao fim. A aplicação alvo é o site de demonstração [Sauce Demo](https://www.saucedemo.com/).

O objetivo foi construir uma suíte de testes robusta, legível, de fácil manutenção e capaz de rodar em múltiplos navegadores.

## ✨ Funcionalidades Testadas

A suíte de testes cobre as principais jornadas de usuário da aplicação, incluindo:

* **Autenticação:**
    * Login com sucesso.
    * Cenários negativos (usuário inválido, senha inválida, campos vazios).
* **Menu Lateral:**
    * Funcionalidade de Logout.
    * Navegação para a página "About".
    * Funcionalidade de fechar o menu.
    * Reset do estado da aplicação (limpeza do carrinho).
* **Inventário de Produtos:**
    * Adicionar um item ao carrinho.
    * Remover um item do carrinho (pela página de inventário).
    * Ordenação dos produtos por preço.
* **Carrinho de Compras:**
    * Verificação de itens, quantidade e preço no carrinho.
    * Remoção de itens de dentro do carrinho.
    * Navegação de volta para a página de produtos ("Continue Shopping").
* **Fluxo de Checkout:**
    * Teste de ponta a ponta (End-to-End) de uma compra bem-sucedida, desde o preenchimento das informações do comprador até a tela de confirmação do pedido.

## 🚀 Tecnologias e Padrões Utilizados

* **Framework:** Robot Framework
* **Linguagem de Programação:** Python
* **Biblioteca de Automação Web:** SeleniumLibrary
* **Bibliotecas de Suporte:** Collections, String
* **Padrão de Arquitetura:**
    * **Page Object Model (POM):** A estrutura foi organizada separando os casos de teste (`tests/`) dos seletores e keywords de ação (`resources/`), seguindo os princípios do POM para desacoplamento e reutilização.
    * **Testes Independentes:** Utilização de `Setup` e `Teardown` para garantir que cada teste rode em um estado limpo e conhecido, evitando o "vazamento de estado" entre eles.
    * **Keywords Reutilizáveis:** Criação de keywords de alto e baixo nível para seguir o princípio D.R.Y. (Don't Repeat Yourself).
* **Ferramentas:**
    * **Git & GitHub:** Para controle de versão.
    * **Python Virtual Environments (`venv`):** Para isolamento de dependências.
    * **PyCharm:** Como IDE de desenvolvimento.

## 🔧 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:
* [Python](https://www.python.org/downloads/) (versão 3.7 ou superior)
* [Git](https://git-scm.com/downloads/)

## 📦 Instalação e Configuração

Siga os passos abaixo para configurar o ambiente localmente:

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/ostheimer-marcelo/RobotProject.git](https://github.com/ostheimer-marcelo/RobotProject.git)
    ```
2.  **Navegue até o diretório do projeto:**
    ```bash
    cd RobotProject
    ```
3.  **Crie e ative um ambiente virtual:**
    ```bash
    # Criar o ambiente
    python -m venv .venv
    
    # Ativar no Windows (cmd.exe)
    .venv\Scripts\activate
    ```
4.  **Instale as dependências:**
    ```bash
    pip install -r requirements.txt
    ```

## ▶️ Executando os Testes

Com o ambiente virtual ativo, você pode executar os testes usando os seguintes comandos a partir da raiz do projeto:

* **Para executar a suíte de regressão completa (todos os 17 testes):**
    ```bash
    python -m robot -d results tests/
    ```
* **Para executar em um navegador diferente (ex: Firefox):**
    ```bash
    python -m robot --variable BROWSER:Firefox -d results tests/
    ```
* **Para executar apenas uma suíte específica (ex: login):**
    ```bash
    python -m robot -d results tests/login/
    ```
* **Para executar testes com uma tag específica (ex: Smoke):**
    ```bash
    python -m robot --include Smoke -d results tests/
    ```

## 📊 Relatórios

Após cada execução, os resultados detalhados são gerados na pasta `results/`.
* **`report.html`**: Um resumo de alto nível da execução, com gráficos e estatísticas.
* **`log.html`**: Um relatório de log extremamente detalhado, com cada passo, keyword e verificação executada. Essencial para depuração.

## 👨‍💻 Autor

**Marcelo Ostheimer**

* **LinkedIn:** [https://www.linkedin.com/in/marceloostheimer/](https://www.linkedin.com/in/marceloostheimer/)
* **GitHub:** [https://github.com/ostheimer-marcelo](https://github.com/ostheimer-marcelo)