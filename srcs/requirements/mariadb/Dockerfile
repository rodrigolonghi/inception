FROM debian:buster

ARG MARIADB_ROOT_PASSWORD

COPY ./requirements/mariadb/tools/createDatabase.sql /docker-entrypoint-initdb.d/
EXPOSE 3306