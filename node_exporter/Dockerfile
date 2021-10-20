#######
### node-exporter
#######
FROM prom/node-exporter

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

EXPOSE      9100
USER        nobody
ENTRYPOINT  [ "/bin/node_exporter" ]
