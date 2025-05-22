FROM mirror.gcr.io/library/mongo:6.0

LABEL maintainer="Debezium Community"

COPY init-inventory.sh /docker-entrypoint-initdb.d/
# COPY init-inventory.sh /usr/local/bin/
COPY insert-inventory-data.js /usr/local/bin/

# RUN chmod +x /usr/local/bin/init-inventory.sh && \
# RUN chmod +x /docker-entrypoint-initdb.d/init-inventory.sh && \
RUN chmod +x /docker-entrypoint-initdb.d/init-inventory.sh && \
    openssl rand -base64 756 > /etc/mongodb.keyfile && \
    chown mongodb /etc/mongodb.keyfile && \
    chmod 400 /etc/mongodb.keyfile

CMD ["mongod", "--replSet", "rs0", "--auth", "--keyFile", "/etc/mongodb.keyfile"]
