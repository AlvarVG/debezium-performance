FROM mysql/mysql-server:8.0.32

LABEL maintainer="Debezium Community"

COPY mysql.cnf /etc/mysql/conf.d/
COPY inventory.sql /docker-entrypoint-initdb.d/
