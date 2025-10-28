FROM quay.io/debezium/example-mysql:3.3.1.Final

LABEL maintainer="Debezium Community"

COPY mysql.cnf /etc/mysql/conf.d/
COPY inventory.sql /docker-entrypoint-initdb.d/
