#!/bin/bash

cd /./assistente-instalacao-sh && source ./includes/utils.sh

x="teste"

modeloExibicao() {
    echo "                                                              "
    echo "                       SELECT'S logs_$select"
    echo -e "$cBlueN==============================================================$cYellowN"
    $select && errorValidation
    echo -e "$cBlueN==============================================================$cYellowN"
    pressEnterContinue
    sleep 1
}

#==================== LOGS CPU ====================
selectCpu() {
    docker exec -i mysql mysql -uroot -proot airvision -e "select id_logs_cpu as ID, em_uso as 'Uso%', data_hora as '=    Data/Hora    =', fk_cpu as 'ID Componente' from logs_cpu order by id_logs_cpu $descOrAsc;"
} #===========================================

#==================== LOGS RAM ====================
selectRam() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_logs_memoria as ID, ram_porcentagem as 'Uso%', data_hora as '=    Data/Hora    =', fk_memoria as 'ID Componente' from logs_memoria order by id_logs_memoria $descOrAsc;"
} #===========================================

#==================== LOGS DISCO ==================
selectDisco() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_logs_disco as ID, tamanho_do_volume as 'MAX', volume_utilizado as 'USED', volume_disponivel as 'OPEN', time_res_seconds as 'TimeUso', data_hora as '=    Data/Hora    =', fk_disco as 'ID Componente' from logs_disco order by id_logs_disco $descOrAsc;"
} #===========================================

#==================== MAQUINA ==================
selectMaquina() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_maquina as 'ID', hostname as 'HOSTNAME', sistema_operacional as 'S.O.', fk_aeroporto as 'ID Aeroporto' from maquina;"
} #===========================================

#==================== COMPONENTE CPU ==================
selectCompCPU() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_cpu as 'ID', fabricante as 'Fabricante', fk_maquina as 'ID Maq.', nome_processador as 'Processador' from cpu;"
} #===========================================

#==================== COMPONENTE RAM ==================
selectCompRAM() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_memoria as 'ID', total as 'MAX', fk_maquina as 'ID Maq.' from memoria;"
} #===========================================

#==================== COMPONENTE DISCO ==================
selectCompDISCO() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_disco as 'ID', left(nome,10) as 'Name DISK', left(modelo,10) as 'Disk Model', fk_maquina as 'ID Maq.' from disco;"
} #===========================================

menuDescOrAsc() {
    while true $opcaoOrdenacao != "teste"; do
        clear
        echo
        echo -e "$cBlueN                     ORDENACAO DO SELECT"
        echo -e "$cBlueN==============================================================$cYellowN"
        echo "             Como deseja a ordenacao de exibicao?           "
        echo
        echo -e "                       1 $cBlueN-$cYellowN CRESCENTE"
        echo -e "                       2 $cBlueN-$cYellowN DECRESCENTE"
        echo -e "                       3 $cBlueN-$cYellowN Volta ao MENU MYSQL"
        echo
        echo "Digite uma opção:"
        read opcaoOrdenacao

        case "$opcaoOrdenacao" in

        1) #====================CRESCENTE====================
            descOrAsc="ASC"
            modeloExibicao
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
            ;;
        2) #====================DECRESCENTE====================
            descOrAsc="DESC"
            modeloExibicao
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
            ;;
        3) #====================VOLTAR MENU MYSQL====================
            argumento="Voltando MENU MYSQL..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
            ;;
        *) #====================INVALIDA====================
            argumento="Opção Inválida..." && sleepTime="1" && execTimeSleepArg
            ;;
        esac
    done
    menuDescOrAsc
}

dockerComandoSQL() {
    echo
    echo -e "$cBlueN                   COMANDOS EXECUTADOS MYSQL"
    echo -e "$cBlueN===================================================================$cYellowN"
    echo
    docker exec mysql mysql -uroot -proot airvision -e "$comandoSQL" && errorValidation
    echo
    echo -e "$cBlueN===================================================================$cYellowN"
}

helpSQL() {
    echo
    echo -e "=============================================================="
    echo -e "                           AJUDA"
    pressEnterContinue
    sleep 1
}

executarMaisComandos() {
    while true $comandoSQL != "teste"; do
        echo
        echo "Executar outro comando? (y/n)"
        read executarMais
        if [ "$executarMais" = 'y' ]; then
            echo
            echo "Digite um comando SQL:"
            echo -e "Ajuda: /help $cMagentaN"
            read comandoSQL
            if [ "$comandoSQL" = '/help' ]; then
                helpSQL
            fi
            dockerComandoSQL
        else
            argumento="Voltando MENU MYSQL..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
        fi
    done
    executarMaisComandos
}

executarComandoSQL() {
    while true $comandoSQL != "teste"; do
        clear
        echo
        echo -e "$cBlueN==============================================================$cYellowN"
        echo -e "                $cMagentaN EXECUTAR COMANDO SQL $cYellowN"
        echo
        echo -e "                   /help $cBlueN-$cYellowN Ajuda com Sintaxe"
        echo -e "                  return $cBlueN-$cYellowN Volta ao MENU MYSQL"
        echo
        echo -e "Digite um comando SQL:$cMagentaN"
        read comandoSQL

        case "$comandoSQL" in

        /help) #====================HELP====================
            argumento="Help SQL - Abrindo..." && sleepTime="2" && execTimeSleepArg
            helpSQL
            ;;
        return) #====================VOLTAR MENU MYSQL====================
            argumento="Voltando MENU MYSQL..." && sleepTime="2" && execTimeSleepArg
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
            ;;
        *) #====================COMANDO====================
            argumento="Executando SQL..." && sleepTime="1" && execTimeSleepArg
            dockerComandoSQL
            executarMaisComandos
            ;;
        esac
    done
    menuDescOrAsc
}
