# Bem vindo ao Assistente de Instalação do AirVision

## 1º Passo - Download do assistente de instalação:

<i>⚠ Observação: Para prosseguir com a instalação e uso do AirVision, será necessário o acesso de administrador da máquina.</i>

- <b>Para obter acesso de administrador:</b> <br>
  🚩 <b>1º</b> Execute o seguinte comando:

  ```sh
  sudo su
  ```

  🚩 <b>2º</b> Informe a `senha` do administrador. <br> <br>

- <b>Para efetuar o download de todos os arquivos necessários:</b> <br>
  🚩 Execute o seguinte comando para efetuar o download e preparação da máquina:

  ```sh
  cd / && git clone -n https://github.com/Alexandre-Gavazzi/assistente-instalacao-sh.git && cd /./assistente-instalacao-sh && git checkout main airvision-install-menu.sh && git checkout main includes && chmod +x airvision-install-menu.sh && chmod +x includes/* && cd /./assistente-instalacao-sh && ./airvision-install-menu.sh
  ```

  <i>`O comando acima está baixando o repositório de instalação/uso, fornecendo as permissões necessárias para os script's em shell e iniciando o menu de instalação/uso do AirVision.`</i> <br>

  <i>⚠`Caso já tenha alguma versão anterior em sua máquina, utilize o seguinte comando antes de efetuar o download, pois o mesmo vai limpar todo ambiente e apagar quaisquer versões anteriores do AirVision.`</i>

  ```sh
  cd / && rm -rf assistente-instalacao-sh
  ```

## 2º Passo - Instalação:

<i>⚠ Observação: Ainda com o acesso de administrador e agora com o menu/instalação aberto:</i> <br>
<i>` Caso não esteja aberto, execute o comando abaixo, pois o mesmo vai abrir o menu de instalação.`</i>

```sh
cd /./assistente-instalacao-sh && ./airvision-install-menu.sh
```

<i>`O comando acima está entrando no diretório do assistente de instalação/uso do AirVision e iniciando o menu de instalação.`</i> <br>

- <b>Instalação do AirVision:</b> <br>
  🚩 <b>1º</b> Execute o seguinte comando dentro do menu de instalação:

  ```sh
  install-airv
  ```

  <i>`O comando acima está atualizando a sua máquina linux, instalando os pacotes(zip, sdkman, java:11) e efetuando o download do executável para o uso do AirVision.`</i>

- <b>Instalação do Docker:</b> <br>
  🚩 <b>2º</b> Execute o seguinte comando dentro do menu de instalação:

  ```sh
  install-docker
  ```

  <i>`O comando acima está atualizando a sua máquina linux, instalando os pacotes(docker.io, docker-compose), dependências(ca-certificates, curl, gnupg, lsb-release), efetuando ajustes em arquivos .gpg, criando variáveis de ambiente, instalando plugins do docker, baixando os arquivos de uso do docker e fornecendo as permissões necessárias os arquivos de uso do docker.`</i> <br> <br>

## 3º Passo - Utilização do AirVision:

<i>⚠ Observação: Ainda com o acesso de administrador e agora com o menu AirVision aberto:</i> <br>
<i>` Caso não esteja aberto, execute o comando abaixo, pois o mesmo vai abrir o menu AirVision.`</i>

```sh
cd /./assistente-instalacao-sh && ./airvision-install-menu.sh
```

<i>`O comando acima está entrando no diretório do assistente de instalação/uso do AirVision e iniciando o menu AirVision.`</i> <br>

- <b>Iniciando os container's do Docker:</b> <br>
  🚩 <b>1º</b> Com o menu AirVision Aberto, execute a `opção 3` para entrar no menu Docker. <br>

  🚩 <b>2º</b> Com o menu Docker Aberto, execute a `opção 1` para iniciar todos os container's do Docker. <br> <br>

- <b>Iniciando a aplicação AirVision CLI(Interface de Linha de Comando)</b> <br>
  🚩 <b>1º</b> Com o menu AirVision Aberto, execute a `opção 1` para abrir a aplicação via Linha de Comando. <br>

  🚩 <b>2º</b> Efetue o Login com suas credenciais. <br>

  🏁 <b>3º</b> Pronto, sua máquina está sendo monitorada. <br>
  `Para visualização da mesma, basta acessar a página de monitoramento no site "www.airvision.com.br" e visualizar sua máquina de qualquer outro dispositivo.` <br> <br>

- <b>Iniciando a aplicação AirVision GUI(Interface Gráfica de Utilizador)</b> <br>
  🚩 <b>1º</b> Com o menu AirVision Aberto, execute a `opção 2` para abrir a aplicação via Interface Gráfica. <br>

  🚩 <b>2º</b> Efetue o Login com suas credenciais. <br>

  🏁 <b>3º</b> Pronto, sua máquina está sendo monitorada. <br>
  `Para visualização da mesma, basta acessar a página de monitoramento no site "www.airvision.com.br" e visualizar sua máquina de qualquer outro dispositivo.`
