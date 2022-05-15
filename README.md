# Bem vindo ao Assistente de Instalação do AirVision

## Instalação

Observação: Para prosseguir com a instalação, será necessário o acesso de administrador da máquina.
 - Para obter acesso de administrador, execute o seguinte comando:
    (1º passo:)
    ```sh
    sudo su
    ```
    (2º passo: informe a senha do administrador.)
 - Agora, já com o acesso de administrador, execute o seguinte comando:
    (1º passo:)
    ```sh
    cd / && git clone -n https://github.com/Alexandre-Gavazzi/assistente-instalacao-sh.git && cd /./assistente-instalacao-sh && git checkout main airvision-install-menu.sh && git checkout main includes && chmod +x airvision-install-menu.sh && chmod +x includes/* && cd /./assistente-instalacao-sh && ./airvision-install-menu.sh
    ```
    (O comando acima está baixando o repositório do instalador, fornecendo as permissões necessárias para os script's em shell e iniciando o menu de instalação/uso do AirVision)