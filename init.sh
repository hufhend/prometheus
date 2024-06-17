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
    sudo touch prometheus/data/queries.active
    sudo touch prometheus/data/lock
    sudo chown -R nobody:nogroup prometheus/data
    sudo chown -R 472:root grafana/data grafana/etc
    sudo chown nobody:nogroup alertmanager/data

  exit 0
fi
    echo "Do not run this script as root"
