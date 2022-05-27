#!/bin/bash

# airvisionJarExists() {
#     cd /./assistente-instalacao-sh
#     if [ -e "airvision.jar" ]; then
#         # echo "                        MONITORAMENTO                         "
#         # echo -e "$cYellowN                            1 - Abrir AirVision CLI           $cBlueN"
#         # echo -e "$cYellowN                            2 - Abrir AirVision GUI           $cBlueN"
#         # echo "--------------------------------------------------------------"
#         existairvisionjar="yes"
#     else
#         # echo "                   COMAND INSTALL AIRVISION                   "
#         # echo -e "$cYellowN                 install-airv - PREPARAR AMBIENTE             $cBlueN"
#         # echo "--------------------------------------------------------------"
#         existairvisionjar="no"
#     fi
# }

# dockerExists() {
#     cd /./assistente-instalacao-sh
#     if [ -e "docker" ]; then
#         # echo "                        DOCKER-COMPOSE                        "
#         # echo -e "$cYellowN                            3 - Abrir MENU DOCKER             $cBlueN"
#         # echo "--------------------------------------------------------------"
#         existdocker="yes"
#     else
#         # echo "                     COMAND INSTALL DOCKER                    "
#         # echo -e "$cYellowN               install-docker - INSTALAR DOCKER               $cBlueN"
#         # echo "--------------------------------------------------------------"
#         existdocker="no"
#     fi
# }

dockerAndAirvisionJarExists() {
    # airvisionJarExists
    # dockerExists
    cd /./assistente-instalacao-sh
    if [ -e "airvision.jar" -a -e "docker" ]; then
        echo "                        MONITORAMENTO                         "
        echo -e "$cYellowN                            1 - Abrir AirVision CLI           $cBlueN"
        echo -e "$cYellowN                            2 - Abrir AirVision GUI           $cBlueN"
        echo "--------------------------------------------------------------"
        echo "                        DOCKER-COMPOSE                        "
        echo -e "$cYellowN                            3 - Abrir MENU DOCKER             $cBlueN"
        echo "--------------------------------------------------------------"
    else
        echo "             COMAND INSTALL AIRVISION AND DOCKER              "
        echo -e "$cYellowN                setup-install - INSTALAR               $cBlueN"
        echo "--------------------------------------------------------------"
    fi
}

installAirvisonJarSettings() {
    sudo git checkout main airvision.jar && errorValidation
    sudo chmod +x airvision.jar && echo -e "$cYellowN chmod airvision.jar...$cReset" && errorValidation
}

installBasicSettings() {
    sudo git checkout main airvision-install-menu.sh && errorValidation
    sudo chmod +x airvision-install-menu.sh && echo -e "$cYellowN chmod airvision-install-menu.sh...$cReset" && errorValidation
}

installDockerSettings() {
    sudo git checkout main airvision-menu-docker.sh && errorValidation
    sudo git checkout main docker && errorValidation
    chmod +x airvision-menu-docker.sh && echo -e "$cYellowN chmod airvision-menu-docker.sh...$cReset" && errorValidation
    cd /./assistente-instalacao-sh/docker
    sudo chmod +x docker-compose.yml && echo -e "$cYellowN chmod docker-compose.yml...$cReset" && errorValidation
    cd /./assistente-instalacao-sh/docker/sql
    sudo chmod +x airvision.sql && echo -e "$cYellowN chmod airvision.sql...$cReset" && errorValidation
    cd /./assistente-instalacao-sh/docker/java
    sudo chmod +x airvision.jar && echo -e "$cYellowN chmod airvision.jar...$cReset" && errorValidation
}
