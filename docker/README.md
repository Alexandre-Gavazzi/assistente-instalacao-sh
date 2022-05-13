# Para executar:
docker-compose up

para iniciar o docker:
  sudo systemctl start docker
  
para iniciar o docker com sistema:
  sudo systemctl enable docker

para entrar no container do mysql:
  docker exec -it mysql bash

  mysql parametros:
   -h   |   host
   -u   |   user
   -p   |   password

para abrir mysql no bash setando host, o usuario e a senha já colocada e o banco já USE(selecionado):
  mysql -h localhost -u user -proot airvision

para abrir mysql no bash sem senha, vai pedir senha e sem o banco selecionado, ou seja, terá que executar "use airvision;" dentro do mysql:
  mysql -u user -p
Se pedir senha, digite:
  root

PARA USAR COMANDO SHELL DENTRO DO mysql bash:
 \! 
 exemplo:
 \! echo oi && sleep 5
 \! clear
 \! sleep 5
 \! read -p "Press Enter to continue ..." sleep

para limpar o cache, memória, containers, imagens e tudo do docker:
  docker rm $(docker ps -aq) -f
  docker rmi $(docker images -aq) -f
  docker volume rm $(docker volume ls -q)
  docker builder prune -f
  
para instalar:
  sudo apt update && sudo apt upgrade -y
  sudo apt install docker.io -y
  sudo apt install docker-compose -y
  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
  sudo apt-get update