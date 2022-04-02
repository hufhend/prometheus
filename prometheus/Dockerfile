#######
### prometheus
#######
FROM prom/prometheus

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

COPY ./etc/prometheus/alert.rules.yml /etc/prometheus/alert.rules.yml
COPY ./etc/prometheus/prometheus.yml /etc/prometheus/prometheus.yml

USER       nobody
EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention.time=90d", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
