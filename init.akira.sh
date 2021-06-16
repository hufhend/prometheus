#   *********************************************
#   script for Prometheus in the docker install
#   begin     : Thu 20 May 2021.
#   copyright : (c) 2021 Václav Dvorský
#   email     : vaclav.dvorsky@inventi.cz
#   $Id: create_directories.sh, v1.50 16/06/2021
#   test with Prom v2.27.1, Grafana v8.0.2
#   *********************************************
#
#   --------------------------------------------------------------------
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public Licence as published by
#   the Free Software Foundation; either version 2 of the Licence, or
#   (at your option) any later version.
#   --------------------------------------------------------------------

#!/bin/bash
if ! [ $(id -u) = 0 ]; then
    if [ -d ../prometheus ]
    then
        echo "Prometheus already exists, I'm just updating"
        rsync -av . ../prometheus/
        cd ../prometheus
        docker-compose pull && docker-compose up -d >/dev/null
        cd ..; rm -rf prometheus-master*
        exit 0
    fi

    cd ..
    [ -f prometheus-master.* ] && rm prometheus-master.*
    [ ! -d prometheus ] && mv prometheus* prometheus
    cd prometheus
    mkdir -p prometheus/data
    mkdir -p prometheus/data/chunks_head
    mkdir -p prometheus/data/wal
    touch prometheus/data/queries.active
    touch prometheus/data/lock
    mkdir -p grafana/data
    sudo chown -R nobody:nogroup prometheus/data/*
    sudo chown -R 472:root grafana/data
    sudo chown root:root prometheus/data
    cd ..
    git clone https://github.com/nginx-proxy/acme-companion
    cd acme-companion
    cp ../prometheus/acme-companion/docker-compose.yml .
    docker-compose up -d
    cd ../prometheus
    docker-compose -f docker-compose.yml -f docker-compose.akira.yml up -d
  exit 0
fi
    echo "This script cannot run root"
    echo "Run it from the same working directory, then docker-compose up"
