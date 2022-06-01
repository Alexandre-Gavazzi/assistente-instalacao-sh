#!/bin/bash

cd /./assistente-instalacao-sh && source ./includes/utils.sh

x="teste"

verificacaoSelect() {
    echo "                                                              "
    echo "                         SELECT logs_$selectLog"
    echo -e "$cBlueN==============================================================$cYellowN"
    if ["$selectLog"="cpu"]; then
        docker exec mysql mysql -uroot -proot airvision -e "select id_logs_cpu as ID, em_uso as 'Uso%', data_hora as '=    Data/Hora    =', fk_cpu as 'ID Componente' from logs_cpu order by id_logs_cpu $descOrAsc;"
        errorValidation
    fi
    if ["$selectLog"="memoria"]; then
        docker exec mysql mysql -uroot -proot airvision -e "select id_logs_memoria as ID, ram_porcentagem as 'Uso%', data_hora as '=    Data/Hora    =', fk_memoria as 'ID Componente' from logs_memoria order by id_logs_memoria $descOrAsc;"
        errorValidation
    fi
    if ["$selectLog"="disco"]; then
        docker exec mysql mysql -uroot -proot airvision -e "select id_logs_disco as ID, tamanho_do_volume as 'MAX', volume_utilizado as 'USED', volume_disponivel as 'OPEN', time_res_seconds as 'TimeUso', data_hora as '=    Data/Hora    =', fk_disco as 'ID Componente' from logs_disco order by id_logs_disco $descOrAsc;"
        errorValidation
    fi
    echo -e "$cBlueN==============================================================$cYellowN"
    pressEnterContinue
    sleep 1
}

menuDescOrAsc() {
    # $descOrAsc
    while true $opcaoOrdenacao != "teste"; do
        clear
        echo
        echo -e "$cBlueN==============================================================$cYellowN"
        echo "             Como deseja a ordenacao de exibicao?           "
        echo
        echo "                       1 - CRESCENTE"
        echo "                       2 - DECRESCENTE"
        echo "                       3 - Volta ao MENU MYSQL"
        echo
        echo "Digite uma opção:"
        read opcaoOrdenacao

        case "$opcaoOrdenacao" in

        1) #====================CRESCENTE====================
            descOrAsc="ASC"
            verificacaoSelect
            ;;
        2) #====================DECRESCENTE====================
            descOrAsc="DESC"
            verificacaoSelect
            ;;
        3) #====================DECRESCENTE====================
            argumento="Voltando MENU MYSQL..." && sleepTime="2" && execTimeSleepArg
            echo -e "$cBlueN"
            cd /./assistente-instalacao-sh && source ./airvision-menu-mysql.sh
            echo -e "$cReset"

            ;;
        *) #====================INVALIDA====================
            argumento="Opção Inválida..." && sleepTime="1" && execTimeSleepArg
            ;;
        esac
    done
    menuDescOrAsc
}
menuDescOrAsc
