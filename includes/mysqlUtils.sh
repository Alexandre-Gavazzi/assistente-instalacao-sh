#!/bin/bash

cd /./assistente-instalacao-sh && source ./includes/utils.sh

x="teste"

modeloExibicao() {
    echo "                                                              "
    echo "                       SELECT'S logs_$select"
    echo -e "$cBlueN==============================================================$cYellowN"
    $select
    echo -e "$cBlueN==============================================================$cYellowN"
    pressEnterContinue
    sleep 1
}

#==================== CPU ====================
selectCpu() {
    docker exec -i mysql mysql -uroot -proot airvision -e "select id_logs_cpu as ID, em_uso as 'Uso%', data_hora as '=    Data/Hora    =', fk_cpu as 'ID Componente' from logs_cpu order by id_logs_cpu $descOrAsc;"
}
fazerSelectCpu() {
    select="selectCpu" && modeloExibicao
} #===========================================

#==================== RAM ====================
selectRam() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_logs_memoria as ID, ram_porcentagem as 'Uso%', data_hora as '=    Data/Hora    =', fk_memoria as 'ID Componente' from logs_memoria order by id_logs_memoria $descOrAsc;"
}
fazerSelectRam() {
    select="selectRam" && modeloExibicao
} #===========================================

#==================== DISCO ==================
selectDisco() {
    docker exec mysql mysql -uroot -proot airvision -e "select id_logs_disco as ID, tamanho_do_volume as 'MAX', volume_utilizado as 'USED', volume_disponivel as 'OPEN', time_res_seconds as 'TimeUso', data_hora as '=    Data/Hora    =', fk_disco as 'ID Componente' from logs_disco order by id_logs_disco $descOrAsc;"
}
fazerSelectDisco() {
    select="selectDisco" && modeloExibicao && errorValidation
} #===========================================

menuDescOrAsc() {
    # $descOrAsc
    while true $opcaoOrdenacao != "teste"; do
        clear
        echo
        echo -e "$cBlueN==============================================================$cYellowN"
        echo "             Como deseja a ordenacao de exibicao?           "
        echo
        echo "                       1 $cBlueN-$cYellowN CRESCENTE"
        echo "                       2 $cBlueN-$cYellowN DECRESCENTE"
        echo "                       3 $cBlueN-$cYellowN Volta ao MENU MYSQL"
        echo
        echo "Digite uma opção:"
        read opcaoOrdenacao

        case "$opcaoOrdenacao" in

        1) #====================CRESCENTE====================
            descOrAsc="ASC"
            ;;
        2) #====================DECRESCENTE====================
            descOrAsc="DESC"
            ;;
        3) #====================DECRESCENTE====================
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
