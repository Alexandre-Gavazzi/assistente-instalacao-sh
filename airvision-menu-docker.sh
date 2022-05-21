#!/bin/bash

x="teste"

cd /./assistente-instalacao-sh
sudo git checkout main includes
source ./includes/utils.sh
source ./includes/dockerUtils.sh

menuDocker() {
    while true $opcaoDocker != "teste"; do
        clear
        echo "                                                              "
        echo -e "$cWhiteN           []        $cYellowN  ___   ____  ___  _  _  ____  ____  "
        echo -e "$cWhiteN       [][][]    (\/)$cYellowN |   \ |    ||  _|| |/ /|  __||    | "
        echo -e "$cWhiteN   __[][][][][]__; / $cYellowN |    \| || || |  |   / | |__ | [] / "
        echo -e "$cWhiteN  |              _/  $cYellowN | [] || || || |  |   \ |  __||   |  "
        echo -e "$cWhiteN  \____,o      _/    $cYellowN |    /| || || |_ | |\ \| |__ | _ \  "
        echo -e "$cWhiteN   \__________/      $cYellowN |___/ |____||___||_| \_\____||_|\_\ "
        echo -e "$cBlueN                                                              "
        echo "=============================================================="
        echo "                         MENU DOCKER                          "
        echo "--------------------------------------------------------------"
        echo "        Iniciar Docker        |         Parar Docker          "
        echo "--------------------------------------------------------------"
        echo -e "$cYellowN  1) Iniciar todos containers $cBlueN|$cYellowN  3) Parar todos containers    "
        echo -e "  2) Iniciar um container     $cBlueN|$cYellowN  4) Parar um container         $cBlueN"
        echo "--------------------------------------------------------------"
        echo "                        OUTROS COMANDOS                       "
        echo -e "$cYellowN                            5 - Limpar Container's            "
        echo "                            6 - Limpar Imagens's              "
        echo "                            7 - Limpar Tudo(cuidado)          "
        echo "                       return - Voltar MENU AIRVISION         "
        echo -e "                         help - AJUDA (desenvolvendo)         $cBlueN"
        echo "=============================================================="
        echo -e "                    Digite a opção desejada:                $cYellowN"
        read opcaoDocker
        echo -e "                      Opção informada ($opcaoDocker)          $cBlueN"
        echo "=============================================================="
        echo "                                                              "
        echo -e "$cReset"
        sleep 1

        case "$opcaoDocker" in

        1) #====================INICIAR TODOS OS CONTAINERS====================
            argumento="Iniciando todos os Container's" && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            cd /./assistente-instalacao-sh/docker
            docker-compose up -d && errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        2) #====================INICIAR UM CONTAINER====================
            argumento="Iniciar um container!" && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            acaoStopOrStart="start"
            dockerStartStop
            errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        3) #====================PARAR TODOS OS CONTAINERS====================
            argumento="Parando todos os Container's..." && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            cd /./assistente-instalacao-sh/docker
            docker-compose stop && errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        4) #====================PARAR UM CONTAINER====================
            argumento="Parar um container!" && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            acaoStopOrStart="stop"
            dockerStartStop
            errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        5) #====================LIMPAR CONTAINERS====================
            argumento="Removendo container's docker..." && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            docker rm $(docker ps -aq) -f && errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        6) #====================LIMPAR IMAGENS====================
            argumento="Removendo imagens docker..." && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            docker rmi $(docker images -aq) -f && errorValidation
            sleep 2
            echo -e "$cReset"
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        7) #====================LIMPAR TUDO====================
            argumento="Remover todos arquivos docker..." && sleepTime="3" && execTimeSleepArg
            echo -e "$cBlueN"
            echo "=============================================================="
            echo -e "$cYellowN          Deseja realmente Limpar Tudo do Docker? (y/N)       "
            read y
            echo -e "                      Opção informada ($y)                    $cBlueN"
            echo -e "=============================================================="
            sleep 2
            if [ $y = y ]; then
                docker rm $(docker ps -aq) -f
                docker rmi $(docker images -aq) -f
                docker volume rm $(docker volume ls -q)
                docker builder prune -f
                sleep 4
                argumento="$cGreenN Remoção efetuada com SUCESSO!$cReset" && sleepTime="3" && execTimeSleepArg
            else
                argumento="$cRedN CANCELADO - Retornando para o MENU DOCKER...$cReset" && sleepTime="3" && execTimeSleepArg
            fi
            echo "================================================"
            ;;

        return) #====================VOLTAR====================
            argumento="Voltando menu airvision..." && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            cd /./assistente-instalacao-sh && source ./airvision-install-menu.sh
            echo -e "$cReset"
            ;;

        help) #====================HELP====================
            argumento="Está em processo de desenvolvimento..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        *) #====================OPÇÃO INVÁLIDA====================
            argumento="Opção Inválida..." && sleepTime="1" && execTimeSleepArg
            ;;
        esac
    done
    menuDocker
}
menuDocker
