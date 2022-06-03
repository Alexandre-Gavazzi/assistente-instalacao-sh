#!/bin/bash

x="teste"

cd /./assistente-instalacao-sh
sudo git checkout main includes
source ./includes/utils.sh

menuMysql() {
    while true $opcaoMysql != "teste"; do
        clear
        echo
        echo -e ''$cWhiteN'  {`\            '$cYellowN'                ______   ______   __'
        echo -e ''$cWhiteN'  \   `-.        '$cYellowN'|\    /|       |  ____| |  __  | |  |'
        echo -e ''$cWhiteN'  \   °  \       '$cYellowN'| \  / |       | |      | |  | | |  |'
        echo -e ''$cWhiteN'   {       \     '$cYellowN'|  \/  | _   _ | |____  | |  | | |  |'
        echo -e ''$cWhiteN'   / .      `.   '$cYellowN'|      | \ \/ /|____  | | |  | | |  |'
        echo -e ''$cWhiteN'   {/ \       `, '$cYellowN'| |\/| |  \  /      | | | |  | | |  |'
        echo -e ''$cWhiteN'       \    \´   '$cYellowN'| |  | |  / /   ____| | | |\\\| | |  |_____'
        echo -e ''$cWhiteN'       {     `-. '$cYellowN'|_|  |_| /_/   |______| |___\\\_| |________|'
        echo -e ''$cBlueN'                                                                 '
        echo "=============================================================="
        echo "                       MENU MYSQL - LOCAL                     "
        echo "--------------------------------------------------------------"
        echo "          Select Logs         |       Select Componentes      "
        echo -e "--------------------------------------------------------------$cYellowN"
        echo -e "          1) Logs CPU         $cBlueN|$cYellowN        4) Componente CPU      "
        echo -e "          2) Logs RAM         $cBlueN|$cYellowN        5) Componente RAM      "
        echo -e "          3) Logs DISCO       $cBlueN|$cYellowN        6) Componente DISCO    "
        echo -e "$cBlueN--------------------------------------------------------------"
        echo -e "                        OUTROS COMANDOS                       $cYellowN"
        echo "                            7 - Select na Maquina Local! "
        echo "                            8 - Efetuar Comando SQL no Banco! "
        echo "                       return - Voltar MENU AIRVISION         "
        echo -e "                         help - AJUDA (desenvolvendo)         $cBlueN"
        echo "=============================================================="
        echo -e "                    Digite a opção desejada:                $cYellowN"
        read opcaoMysql
        echo -e "                      Opção informada ($opcaoMysql)          $cBlueN"
        echo "=============================================================="
        echo "                                                              "
        echo -e "$cReset"
        sleep 1

        case "$opcaoMysql" in

        1) #====================SELECT LOGS CPU====================
            argumento="Efetuando exibicao dos Logs CPU..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectCpu" && menuDescOrAsc
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        2) #====================SELECT LOGS RAM====================
            argumento="Efetuando exibicao dos Logs RAM..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectRam" && menuDescOrAsc
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        3) #====================SELECT LOGS DISCO====================
            argumento="Efetuando exibicao dos Logs DISCO..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectDisco" && menuDescOrAsc
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        4) #====================SELECT COMPONENTE CPU====================
            argumento="Efetuando exibicao do Comp. CPU..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectCompCPU" && modeloExibicao
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        5) #====================SELECT COMPONENTE RAM====================
            argumento="Efetuando exibicao do Comp. RAM..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectCompRAM" && modeloExibicao
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        6) #====================SELECT COMPONENTE DISCO====================
            argumento="Efetuando exibicao do Comp. DISCO..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectCompDISCO" && modeloExibicao
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;

        7) #====================SELECT MAQUINA LOCAL==================== 
            argumento="Efetuando exibicao da MAQUINA..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh/includes && source ./mysqlUtils.sh
            select="selectMaquina" && modeloExibicao
            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
            echo "================================================"
            ;;
        8) #====================EXECUTAR COMANDO NO BANCO====================
            argumento="Iniciando Interacao SQL..." && sleepTime="2" && execTimeSleepArg

            argumento="Script Concluído..." && sleepTime="2" && execTimeSleepArg
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
    menuMysql
}
menuMysql
