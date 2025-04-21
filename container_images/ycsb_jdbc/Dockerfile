FROM alpine:3.21.3

LABEL maintainer="Alvar Viana Gomez (aviana@redhat.com)"

# In case we want to update/downgrade versions
ARG YCSB_VERSION="0.17.0" \
    MYSQL_JDBC_VERSION="9.1.0" \
    POSTGRESQL_MYSQL_JDBC_VERSION="42.6.1"

# Setting the default values, so it can be overriden only with environment variables
ENV WORKLOAD_FILENAME="workloada" \
    CONFIG_FILENAME="mysql.properties" \
    TABLE_NAME="usertable_0" \
    NUM_PROCESSES="1" \
    TOTAL_RECORDS="10000" \
    MAX_THROUGHPUT="1000" \
    DEBUG=false

# Create folders to be used later on
RUN mkdir -p /ycsb /ycsb/results

# Install java 17 dependency
RUN apk add --no-cache openjdk17

# Download and uncompress YCSB.
RUN wget https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-jdbc-binding-${YCSB_VERSION}.tar.gz && \
    tar xf ycsb-jdbc-binding-${YCSB_VERSION}.tar.gz -C /ycsb --strip-components=1 && \
    rm -rf ycsb-jdbc-binding-${YCSB_VERSION}.tar.gz

# Download jdbc connectors for postgres and mysql
RUN wget -O /ycsb/lib/mysql-connector-j-${MYSQL_JDBC_VERSION}.jar https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/${MYSQL_JDBC_VERSION}/mysql-connector-j-${MYSQL_JDBC_VERSION}.jar && \
    wget -O /ycsb/lib/postgresql-${POSTGRESQL_MYSQL_JDBC_VERSION}.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRESQL_MYSQL_JDBC_VERSION}/postgresql-${POSTGRESQL_MYSQL_JDBC_VERSION}.jar

# Set workdir and copy needed files
WORKDIR /ycsb
COPY conf/. conf/.
COPY --chmod=777 entrypoint.sh entrypoint.sh

# Run custom entrypoint command
ENTRYPOINT ["/ycsb/entrypoint.sh"]