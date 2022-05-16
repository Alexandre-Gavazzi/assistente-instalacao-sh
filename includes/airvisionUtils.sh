#!/bin/bash

airvisionJarExists() {
    cd /./assistente-instalacao-sh
    if [ -e "airvision.jar" ]; then
        # echo "                        MONITORAMENTO                         "
        # echo -e "$cYellowN                            1 - Abrir AirVision CLI           $cBlueN"
        # echo -e "$cYellowN                            2 - Abrir AirVision GUI           $cBlueN"
        # echo "--------------------------------------------------------------"
        existairvisionjar="yes"
    else
        # echo "                   COMAND INSTALL AIRVISION                   "
        # echo -e "$cYellowN                 install-airv - PREPARAR AMBIENTE             $cBlueN"
        # echo "--------------------------------------------------------------"
        existairvisionjar="no"
    fi
}

dockerExists() {
    cd /./assistente-instalacao-sh
    if [ -e "docker" ]; then
        # echo "                        DOCKER-COMPOSE                        "
        # echo -e "$cYellowN                            3 - Abrir MENU DOCKER             $cBlueN"
        # echo "--------------------------------------------------------------"
        existdocker="yes"
    else
        # echo "                     COMAND INSTALL DOCKER                    "
        # echo -e "$cYellowN               install-docker - INSTALAR DOCKER               $cBlueN"
        # echo "--------------------------------------------------------------"
        existdocker="no"
    fi
}

dockerAndAirvisionJarExists() {
    airvisionJarExists
    dockerExists
    if [ existairvisionjar="yes" -a existdocker="yes" ]; then
        echo "                        MONITORAMENTO                         "
        echo -e "$cYellowN                            1 - Abrir AirVision CLI           $cBlueN"
        echo -e "$cYellowN                            2 - Abrir AirVision GUI           $cBlueN"
        echo "--------------------------------------------------------------"
        echo "                        DOCKER-COMPOSE                        "
        echo -e "$cYellowN                            3 - Abrir MENU DOCKER             $cBlueN"
        echo "--------------------------------------------------------------"
    else
        echo "             COMAND INSTALL AIRVISION AND DOCKER              "
        echo -e "$cYellowN                setup-install - INSTALAR DOCKER               $cBlueN"
        echo "--------------------------------------------------------------"
    fi
}

installAirvisonJarSettings() {
    git checkout main airvision.jar && errorValidation
    chmod +x airvision.jar && echo -e "$cYellowN chmod airvision.jar...$cReset" && errorValidation
}

installBasicSettings() {
    git checkout main airvision-install-menu.sh && errorValidation
    chmod +x airvision-install-menu.sh && echo -e "$cYellowN chmod airvision-install-menu.sh...$cReset" && errorValidation
}

installDockerSettings() {
    git checkout main airvision-menu-docker.sh && errorValidation
    git checkout main docker && errorValidation
    chmod +x airvision-menu-docker.sh && echo -e "$cYellowN chmod airvision-menu-docker.sh...$cReset" && errorValidation
    cd /./assistente-instalacao-sh/docker
    chmod +x docker-compose.yml && echo -e "$cYellowN chmod docker-compose.yml...$cReset" && errorValidation
    cd /./assistente-instalacao-sh/docker/initdb
    chmod +x airvision.sql && echo -e "$cYellowN chmod airvision.sql...$cReset" && errorValidation
}
