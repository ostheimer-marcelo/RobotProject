# chrome_options_helper.py
from selenium.webdriver.chrome.options import Options


def get_chrome_options():
    """
    Esta função cria e configura o objeto de Opções do Chrome
    para desabilitar os pop-ups de senha.
    """
    chrome_options = Options()

    # Adiciona os argumentos para desabilitar os pop-ups
    chrome_options.add_argument("--start-maximized")
    chrome_options.add_argument("--disable-save-password-bubble")
    chrome_options.add_argument("--disable-features=PasswordLeakDetection")

    # Retorna o objeto de opções pronto para ser usado pelo Robot Framework
    return chrome_options