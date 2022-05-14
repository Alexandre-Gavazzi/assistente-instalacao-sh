#!/bin/bash

dockerStartStop() {
    echo "                                                              "
    echo "                    TODOS OS CONTAINERS"
    echo -e "==============================================================$cYellowN"
    docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Image}}"
    echo -e "$cBlueN==============================================================$cYellowN"
    echo "     Digite o nome do container, como descrito na tabela:     "
    read opcaoContainerInformado
    echo -e "                  Container informado ($opcaoContainerInformado)$cBlueN"
    echo "=============================================================="
    sleep 1
    docker $acaoStopOrStart $opcaoContainerInformado
}