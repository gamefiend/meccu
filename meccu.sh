#!/bin/bash
# meccu. small bash script that runs metrics and send to a carbon database.
# low dependencies, uses many builtins to be used on older systems. quick to run and get going.
# QHM 12-16-2015
{
trap '' HUP # ignore hangups at end of the script to run independently of the shell and run continously.
## config boilerplate. EDIT HERE #####
# Interval in seconds of update
INTERVAL=10
# graphite server location
GRAPHITE_SERVER="graphite.server.domain"
# graphite server port
PORT='2003'
#this is where your metric scripts are located.
# metric scripts are a little weird right now.
# the first line is assumed to be for interpreter
# the second line will be commented and have the name of the metric.
# subsequent lines will have data collecting script, returning a value that meccu picks up and sends to graphite.
METRICS="/default/path/meccu/metrics"
# Graphite base path for writing.
GRAPHITE_BASE="graphite.path.servers"
######################################

# Set the hostname of the running server.
HOSTNAME=$(hostname -s)
# Creating the graphite root which we'll append our metrics to. Will look like:
# graphite.path.servers.HOSTNAME.metric
GRAPHITE_ROOT="${GRAPHITE_BASE}.${HOSTNAME}"


while :
do
#each INTERVAL seconds...
# set a timestamp
TIMESTAMP=$(date +%s)
# ... then execute each metric in the $METRIC Folder
for i in $(find ${METRICS} -type f )
    do
    # get the metric name. It looks on the second line (for you to set env/shell on first)
    GRAPHITE_NAME=$(head -2 $i | tail -1 | cut -d '#' -f2)
    #execute script --scripts must be executable
    GRAPHITE_VALUE=$(sh $i)
    #send to graphite via netcat. keep a max timeout of 2 seconds per write.
    echo "${GRAPHITE_ROOT}.${GRAPHITE_NAME} ${GRAPHITE_VALUE} ${TIMESTAMP}" | nc -w 2 ${GRAPHITE_SERVER} ${PORT}

    done
# then sleep
sleep ${INTERVAL}

# End of cycle
done
} < /dev/null > /var/run/meecu.pid 2>&1 &
