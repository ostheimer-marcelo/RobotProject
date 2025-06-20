# chrome_options_helper.py
from selenium.webdriver.chrome.options import Options


def get_chrome_options():
    """
    Cria e configura o objeto de Opções do Chrome, com argumentos
    específicos para estabilidade em ambientes de CI/CD (como GitHub Actions).
    """
    chrome_options = Options()

    # Opções que já tínhamos para desabilitar pop-ups de senha
    chrome_options.add_argument("--disable-save-password-bubble")
    chrome_options.add_argument("--disable-features=PasswordLeakDetection")

    # --- NOVOS ARGUMENTOS PARA ESTABILIDADE NO GITHUB ACTIONS ---
    chrome_options.add_argument("--headless")  # Garante que o Chrome rode em modo "invisível"
    chrome_options.add_argument("--no-sandbox")  # Essencial para rodar em ambientes Linux/Docker
    chrome_options.add_argument("--disable-dev-shm-usage")  # Evita problemas de memória compartilhada no servidor
    chrome_options.add_argument("--disable-gpu")  # Desabilita aceleração por GPU, que não existe no servidor
    chrome_options.add_argument("--window-size=1920,1080")  # Define um tamanho de janela fixo e previsível

    # Retorna o objeto de opções pronto para ser usado pelo Robot Framework
    return chrome_options