ARG MARIADB_VERSION=10.6-focal
FROM mariadb:${MARIADB_VERSION}

ARG TZ=UTC
ENV TZ=${TZ}

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

COPY ./create_db/*.sql /docker-entrypoint-initdb.d/