#######
### alertmanager
#######
FROM prom/alertmanager

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

COPY ./etc/alertmanager/alertmanager.yml /etc/alertmanager/alertmanager.yml

USER       nobody
EXPOSE     9093
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "--config.file=/etc/alertmanager/alertmanager.yml", \
             "--storage.path=/alertmanager" ]
