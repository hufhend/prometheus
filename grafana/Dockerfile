#######
### grafana
#######
FROM grafana/grafana

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

#COPY ./etc/grafana.ini /etc/grafana/grafana.ini

LABEL maintainer="Grafana team <hello@grafana.com>"

EXPOSE 3000
USER grafana
ENTRYPOINT [ "/run.sh" ]
