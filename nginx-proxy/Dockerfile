# We use maximum default configuration for seamless upgrade to the latest version.
# This is part of the acme-companion for SSL from Let's Encrypt.

#######
### nginx-proxy
#######
FROM nginxproxy/nginx-proxy

#######
### CI
#######
#FROM base as CI

#######
### production
#######
#FROM base as production

LABEL maintainer="Nicolas Duchon <nicolas.duchon@gmail.com> (@buchdag)"

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["forego", "start", "-r"]
