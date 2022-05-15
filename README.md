# Bem vindo ao Assistente de Instalação do AirVision

## 1º Passo - Download do assistente de instalação:

Observação: Para prosseguir com a instalação, será necessário o acesso de administrador da máquina.

- Para obter acesso de administrador: <br>
  1º execute o seguinte comando:

  ```sh
  sudo su
  ```

  2º informe a senha do administrador. <br> <br>

- Agora, já com o acesso de administrador: <br>
  3º execute o seguinte comando:
  ```sh
  cd / && git clone -n https://github.com/Alexandre-Gavazzi/assistente-instalacao-sh.git && cd /./assistente-instalacao-sh && git checkout main airvision-install-menu.sh && git checkout main includes && chmod +x airvision-install-menu.sh && chmod +x includes/* && cd /./assistente-instalacao-sh && ./airvision-install-menu.sh
  ```
  O comando acima está baixando o repositório de instalação/uso, fornecendo as permissões necessárias para os script's em shell e iniciando o menu de instalação/uso do AirVision. <br> <br>

## 2º Passo - Instalação:

Ainda com o acesso de administrador e agora com o menu/instalação aberto: <br>

- Instalação do AirVision: <br>
  1º execute o seguinte comando:

  ```sh
  install-airv
  ```

  O comando acima está atualizando a sua máquina linux, instalando os pacotes(zip, sdkman, java:11) e efetuando o download do executável para o uso do AirVision.

- Instalação do Docker: <br>
  2º execute o seguinte comando:

  ```sh
  install-docker
  ```

  O comando acima está atualizando a sua máquina linux, instalando os pacotes(docker.io, docker-compose), dependências(ca-certificates, curl, gnupg, lsb-release), efetuando ajustes em arquivos .gpg, criando variáveis de ambiente, instalando plugins do docker, baixando os arquivos de uso do docker e fornecendo as permissões necessárias os arquivos de uso do docker.
