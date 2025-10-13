ARG MARIADB_VERSION="12.0.2"

FROM mariadb:${MARIADB_VERSION}
#FROM healthcheck/mariadb

LABEL maintainer="Ferimer, Servicios informáticos"

ENV MYSQL_ALLOW_EMPTY_PASSWORD=1
#ENV MYSQL_RANDOM_ROOT_PASSWORD=1

RUN mkdir /backups
VOLUME /backups

COPY scripts/backup/* /opt/
COPY scripts/*sql /docker-entrypoint-initdb.d

