#!/bin/bash

dockerStartStop() {
    echo "                                                              "
    echo "                    TODOS OS CONTAINERS"
    echo "=============================================================="
    docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Image}}"
    echo "=============================================================="
    echo "     Digite o nome do container, como descrito na tabela:     "
    read opcaoContainerInformado
    echo "                  Container informado ($opcaoContainerInformado)"
    echo "=============================================================="
    sleep 1
    docker $acaoStopOrStart $opcaoContainerInformado && errorValidation
    unset acaoStopOrStart
}