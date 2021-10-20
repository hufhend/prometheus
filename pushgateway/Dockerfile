#######
### pushgateway
#######
FROM prom/pushgateway

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

EXPOSE 9091
WORKDIR /pushgateway
USER 65534
ENTRYPOINT [ "/bin/pushgateway" ]
