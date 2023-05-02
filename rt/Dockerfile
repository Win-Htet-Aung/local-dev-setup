ARG VERSION=latest
FROM netsandbox/request-tracker-base:${VERSION}

USER root

# https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425#set--o-pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -xe; \
  apt-get update -yqq && \
  apt-get install -yqq \
    gcc \
    libdbd-mysql-perl \
    make \
    spawn-fcgi

RUN set -xe; \
  cpan App::cpanminus && \
  cpanm FCGI

WORKDIR /usr/local

COPY RT_SiteConfig.pm etc/
COPY docker-entrypoint.sh bin/
COPY scripts bin/

RUN set -xe; \
  chmod ugo+x bin/install.sh bin/docker-entrypoint.sh

ARG RT_WEB_PORT

EXPOSE ${RT_WEB_PORT}
