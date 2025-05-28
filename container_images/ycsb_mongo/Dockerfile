FROM alpine:3.21.3

LABEL maintainer="Alvar Viana Gomez (aviana@redhat.com)"

# In case we want to update/downgrade versions
ARG YCSB_VERSION="0.17.0"

# Setting the default values, so it can be overriden with environment variables
ENV WORKLOAD_FILENAME="workloada" \
    CONFIG_FILENAME="mongodb.properties" \
    TABLE_NAME="usertable_0" \
    NUM_PROCESSES="1" \
    TOTAL_RECORDS="10000" \
    MAX_THROUGHPUT="1000" \
    ASYNC=false \
    DEBUG=false

# Create folders to be used later on
RUN mkdir -p /ycsb /ycsb/results

# Install java 17 dependency
RUN apk add --no-cache openjdk17

# Download and uncompress YCSB.
RUN wget https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-mongodb-binding-${YCSB_VERSION}.tar.gz && \
    tar xf ycsb-mongodb-binding-${YCSB_VERSION}.tar.gz -C /ycsb --strip-components=1 && \
    rm -rf ycsb-mongodb-binding-${YCSB_VERSION}.tar.gz

# Set workdir and copy needed files
WORKDIR /ycsb
COPY conf/. conf/.
COPY --chmod=777 entrypoint.sh entrypoint.sh

# Run custom entrypoint command
ENTRYPOINT ["/ycsb/entrypoint.sh"]