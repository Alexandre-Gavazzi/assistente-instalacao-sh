#!/bin/bash

x="teste"

cd /./assistente-instalacao-sh
git checkout main includes
source ./includes/utils.sh
source ./includes/airvisionUtils.sh

menu() {
    while true $x != "teste"; do
        clear
        echo "                                                              "
        echo -e "$cWhiteN    |\    $cYellowN  ____  O  ____ __     __ O  _____  O  ____  _   _   "
        echo -e "$cWhiteN |\_| \   $cYellowN |    || ||    |\ \   / /| | |   _|| ||    || \ | |  "
        echo -e "$cWhiteN | _   [D)$cYellowN | [] || || [] / \ \_/ / | | |  |  | || || ||  \| |  "
        echo -e "$cWhiteN |/ | /   $cYellowN | __ || || _ |   \   /  | | _|  | | || || || |\  |  "
        echo -e "$cWhiteN    |/    $cYellowN |_||_||_||_|\_\   \_/   |_||____| |_||____||_| \_|  "
        echo -e "$cBlueN                                                              "
        echo "=============================================================="
        echo "                        MENU AIRVISION                        "
        echo "--------------------------------------------------------------"
        dockerAndAirvisionJarExists
        echo "                        OUTROS COMANDOS                       "
        echo -e "$cYellowN                         exit - SAIR                          "
        echo "                       update - ATUALIZAR                     "
        echo -e "                         help - AJUDA (desenvolvendo)         $cBlueN"
        echo "=============================================================="
        echo -e "                    Digite a opção desejada:                  $cYellowN"
        read x
        echo -e "                      Opção informada ($x)                    $cBlueN"
        echo "=============================================================="
        echo "                                                              "
        echo -e "$cReset"
        sleep 1

        case "$x" in

        setup-install) #====================INSTALAR TUDO PARA COMEÇAR A USAR O MONITORAMENTO/DOCKER====================
            argumento="Atualizando Sistema...($cWhiteN 1 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            echo -e "$cBlueN" && sudo apt update && sudo apt upgrade -y

            argumento="Instalando Zip...($cWhiteN 2 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            sudo apt install zip -y

            argumento="Download sdkman...($cWhiteN 3 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            curl -s "https://get.sdkman.io" | bash

            argumento="Reiniciando Terminal($cWhiteN 4 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            source "/home/$USER/.sdkman/bin/sdkman-init.sh"

            argumento="Instalando Java...($cWhiteN 5 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            sudo apt install openjdk-11-jre -y

            argumento="Download arquivo de instalacao/menu...($cWhiteN 6 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            cd /
            if [ -e "/assistente-instalacao-sh" ]; then
                cd /./assistente-instalacao-sh
                git pull && errorValidation
                installBasicSettings
                installAirvisonJarSettings
            else
                git clone -n https://github.com/Alexandre-Gavazzi/assistente-instalacao-sh.git && errorValidation
                cd /./assistente-instalacao-sh
                installBasicSettings
                installAirvisonJarSettings
            fi

            argumento="Atualizando Sistema...($cWhiteN 7 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt update && sudo apt upgrade -y

            argumento="Instalando docker...($cWhiteN 8 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt install docker.io -y

            argumento="Instalando docker-compose...($cWhiteN 9 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt install docker-compose -y

            # Instalando ca-certificates...Instalando curl...Instalando gnupg...Instalando lsb-release...
            argumento="Instalando dependências para o Docker...($cWhiteN 10 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt-get install \
            ca-certificates \
            curl \
            gnupg \
            lsb-release -y

            argumento="Download de arquivos necessários...($cWhiteN 11 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

            argumento="Criando variáveis de ambiente para instalação...($cWhiteN 12 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
             $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

            argumento="Atualizando Sistema...($cWhiteN 13 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt-get update

            #Instalando docker-ce... docker-ce-cli... containerd.io... docker-compose-plugin...
            argumento="Instalando dependências para o Docker...($cWhiteN 14 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

            argumento="Atualizando Sistema...($cWhiteN 15 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            sudo apt-get update

            argumento="Download arquivos docker-airvision...($cWhiteN 16 $cYellowN/$cRedN 17 $cYellowN)$cReset" && sleepTime="3" && execTimeSleepArg
            cd /
            if [ -e "/assistente-instalacao-sh" ]; then
                cd /./assistente-instalacao-sh
                git pull && errorValidation
                installBasicSettings
                installDockerSettings
            else
                git clone -n https://github.com/Alexandre-Gavazzi/assistente-instalacao-sh.git && errorValidation
                cd /./assistente-instalacao-sh
                installBasicSettings
                installDockerSettings
            fi

            sudo systemctl enable docker

            argumento="Script Concluído...($cGreenN 17 $cYellowN/$cGreenN 17 $cYellowN)$cReset" && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        1) #====================INICIAR O AirVision.jar via | Interface de Linha de Comando(CLI) Command Line Interface====================
            argumento="Iniciando... AirVision Command Line Interface" && sleepTime="3" && execTimeSleepArg
            cd /./assistente-instalacao-sh
            chmod +x airvision.jar
            java -jar airvision.jar CLI

            argumento="Finalizando CLI..." && sleepTime="3" && execTimeSleepArg
            echo "================================================"
            ;;

        2) #====================INICIAR O AirVision.jar via | Interface Gráfica do Utilizador(GUI) Graphical User Interface====================
            argumento="Iniciando... AirVision Graphical User Interface" && sleepTime="3" && execTimeSleepArg
            cd /./assistente-instalacao-sh
            chmod +x airvision.jar
            java -jar airvision.jar

            argumento="Finalizando GUI..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        3) #====================ABRINDO MENU DOCKER====================
            argumento="Abrindo menu docker..." && sleepTime="3" && execTimeSleepArg
            cd /./assistente-instalacao-sh && source ./airvision-menu-docker.sh
            echo "================================================"
            ;;

        update) #====================ATUALIZAR====================
            argumento="Atualizando..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh
            git pull && errorValidation && source ./airvision-install-menu.sh
            echo "================================================"
            ;;

        help) #====================AJUDA====================
            argumento="Está em processo de desenvolvimento..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        exit) #====================SAIR====================
            argumento="Saindo..." && sleepTime="3" && execTimeSleepArg
            # FINALIZA TODOS OS BASH, MAS NÃO VOU UTILIZAR, MAS É UM COMANDO LINDO!
            # ps -ef | grep bash | xargs -r -n1
            exit 0
            echo "================================================"
            ;;
        *)
            argumento="Opção Inválida..." && sleepTime="1" && execTimeSleepArg
            ;;
        esac
    done
    menu
}
menu
