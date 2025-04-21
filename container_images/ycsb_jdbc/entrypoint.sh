#!/bin/sh

# Checks parameters are well configured
validations() {
    VALIDATED="true"
    if [ -z ${WORKLOAD_FILENAME} ]; then
        echo "The variable WORKLOAD_FILENAME is empty and it should not be empty"
        VALIDATED="false"
    fi
    if [ -z ${CONFIG_FILENAME} ]; then
        echo "The variable CONFIG_FILENAME is empty and it should not be empty"
        VALIDATED="false"
    fi
    if [ -z ${TABLE_NAME} ]; then
        echo "The variable TABLE_NAME is empty and it should not be empty"
        VALIDATED="false"
    fi
    if [ ${NUM_PROCESSES} -lt 1 ]; then
        echo "The variable NUM_PROCESSES must be greater than 0"
        VALIDATED="false"
    fi
    if [ ${MAX_THROUGHPUT} -lt 1 ]; then
        echo "The variable MAX_THROUGHPUT must be greater than 0"
        VALIDATED="false"
    fi
    if [ ${TOTAL_RECORDS} -lt ${NUM_PROCESSES} ]; then
        echo "The variable TOTAL_RECORDS must be greater than NUM_PROCESSES"
        VALIDATED="false"
    fi
    
    if [ ${VALIDATED} == "false" ]; then
        exit 1
    fi
}

# Print actual environment variables
echo "----------------------------------"
echo "WORKLOAD_FILENAME: ${WORKLOAD_FILENAME}"
echo "CONFIG_FILENAME: ${CONFIG_FILENAME}"
echo "TABLE_NAME: ${TABLE_NAME}"
echo "NUM_PROCESSES: ${NUM_PROCESSES}"
echo "TOTAL_RECORDS: ${TOTAL_RECORDS}"
echo "MAX_THROUGHPUT: ${MAX_THROUGHPUT}"
echo "DEBUG: ${DEBUG}"
echo "----------------------------------"

# Validate input parametres (environment variables)
validations

# In case debug is enabled, we print everything
if [ ${DEBUG} == "true" ]; then
    set -x
fi

# Calculate the number of records per process
RECORDS_PER_PROCESS=$((TOTAL_RECORDS / NUM_PROCESSES))

# For multiple processes, store the params needed
RECORD_PARAMS=""
if [ ${NUM_PROCESSES} -gt 1 ]; then
    RECORD_PARAMS="-p recordcount=${TOTAL_RECORDS}"
fi

# Verify if TABLE_NAME contains commas
if [[ "$TABLE_NAME" == *,* ]]; then
  # Set TABLE_NAME separator to commas
  IFS=','
fi

for TABLE in $TABLE_NAME; do
    # Load the table content divided into processes
    PROC=0
    while [ $PROC -lt $NUM_PROCESSES ]; do
        INSERT_START=$((PROC * RECORDS_PER_PROCESS))

        INSERT_PARAMS=""
        if [ ${NUM_PROCESSES} -gt 1 ]; then
            INSERT_PARAMS="-p insertstart=${INSERT_START} -p insertcount=${RECORDS_PER_PROCESS}"
        fi

        echo "Loading for table '$TABLE' and process number '$PROC'"
        /ycsb/bin/ycsb.sh load jdbc -s \
            -P workloads/${WORKLOAD_FILENAME} \
            -P conf/${CONFIG_FILENAME} \
            -p target=${MAX_THROUGHPUT} \
            -p table=${TABLE} ${INSERT_PARAMS} &
        PROC=$(( PROC + 1 ))
    done
done

# Wait until the process we launched has finished
echo "Waiting for load processes to finish"
wait

for TABLE in $TABLE_NAME; do
    echo "Running for table '$TABLE'"
    # Run the workload per table
    /ycsb/bin/ycsb.sh run jdbc -s \
        -P workloads/${WORKLOAD_FILENAME} \
        -P conf/${CONFIG_FILENAME} ${RECORD_PARAMS} \
        -p target=${MAX_THROUGHPUT} \
        -p measurement.interval=both \
        -p table=${TABLE} > results/${TABLE}.dat 2>&1 &
        # Use this when issue solved: https://github.com/HdrHistogram/HdrHistogram/issues/175
        # -p hdrhistogram.output.path=results/${TABLE}.hist \
done

# Wait until the process we launched has finished
echo "Waiting for running processes to finish"
wait

# Final message confirming the correct operation of the program
echo "YCSB benchmark successfully completed"
