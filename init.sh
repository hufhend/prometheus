#   *******************************************
#   script for Prometheus in the docker install
#   begin     : Thu 20 May 2021.
#   copyright : (c) 2021 Václav Dvorský
#   email     : vaclav.dvorsky@inventi.cz
#   $Id: init.sh, v1.75 20/10/2021
#   test with Prom v2.27.1, Grafana v8.0.2
#   *******************************************
#
#   --------------------------------------------------------------------
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public Licence as published by
#   the Free Software Foundation; either version 2 of the Licence, or
#   (at your option) any later version.
#   --------------------------------------------------------------------

#!/bin/bash
if ! [ $(id -u) = 0 ]; then
    if [ -d KLF ]
    then
        echo "The Prometheus directory already exists"
        exit 0
    fi

    # preparing the environment for the first run
    mkdir -p prometheus/data
    mkdir -p prometheus/data/chunks_head
    mkdir -p prometheus/data/wal
    mkdir -p grafana/data
    mkdir -p alertmanager/data
    touch prometheus/data/queries.active
    touch prometheus/data/lock
    sudo chown -R nobody:nogroup prometheus/data
    sudo chown -R 472:root grafana/data
    sudo chown nobody:nogroup alertmanager/data

    # docker installation
    # sudo apt-get -f install && sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
    # sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    # echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    # sudo apt-get update
    # sudo apt install -y docker-ce docker-ce-cli containerd.io
    # sudo usermod -aG docker ${USER}
    # echo "The environment is ready, Docker is installed, proceed through the GitLab"

    # uncomment for manual installation, we use the last version docker-compose before v2
    # sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    # sudo chmod +x /usr/local/bin/docker-compose
    # sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    # sudo apt-get install -y sysstat && sudo systemctl enable sysstat && sudo sed -i 's/false/true/g' /etc/default/sysstat
    # id -nG && systemctl is-enabled docker && docker-compose --version

  exit 0
fi
    echo "Do not run this script as root"
