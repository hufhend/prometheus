# We use maximum default configuration for seamless upgrade to the latest version.
# This is part of the acme-companion for SSL from Let's Encrypt.

#######
### acme-companion
#######
FROM nginxproxy/acme-companion

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="Nicolas Duchon <nicolas.duchon@gmail.com> (@buchdag)"

ENTRYPOINT [ "/bin/bash", "/app/entrypoint.sh" ]
CMD [ "/bin/bash", "/app/start.sh" ]
