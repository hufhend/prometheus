#######
### snmp-exporter
#######
FROM prom/snmp-exporter

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

EXPOSE      9116
USER        nobody
ENTRYPOINT  [ "/bin/snmp_exporter" ]
CMD         [ "--config.file=/etc/snmp_exporter/snmp.yml" ]
