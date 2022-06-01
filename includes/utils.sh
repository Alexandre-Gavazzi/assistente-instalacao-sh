#!/bin/bash

# CORES
# ALTERA A COR DO TEXTO, \e[<cor do texto>;<cor do fundo>;<tipo de texto>m (esse m no final é sempre obrigatório).
cBlackN="\e[30;1m"
cRedN="\e[31;1m"
cGreenN="\e[32;1m"
cYellowN="\e[33;1m"
cBlueN="\e[34;1m"
cMagentaN="\e[35;1m"
cCianoN="\e[36;1m"
cWhiteN="\e[37;1m"
cReset="\e[m"

execTimeSleepArg() {
    for ((i = $sleepTime; i >= 1; i--)); do
        clear
        echo
        echo -e "$cYellowN        ---> $argumento $cYellowN<---$cReset"
        echo
        echo -e "$cBlueN============ Execução em$cRedN $i...$cBlueN============$cReset"
        sleep 1
    done
    unset sleepTime
    unset argumento
    clear
}

errorValidation() {
    if [ "$?" -eq 0 ]; then
        # AQUI QUER DIZER QUE NÃO OBTEVE ERROS
        echo ""
        echo -e "$cGreenN============================================"
        echo "============ SCRIPT EFETUADO... ============"
        echo -e "============================================$cReset" && sleep 2
    else
        # AQUI QUER DIZER QUE FOI DETECTADO ERROS
        echo ""
        echo -e "$cRedN============================================"
        echo "============== ERRO DETECTADO =============="
        echo -e "============================================$cReset" && sleep 5
    fi
}

pressEnterContinue() {
    echo && read -p "===  Press Enter to continue ..."
    clear
}
