#!/bin/bash
#load1
LOADAVG1=$(cat /proc/loadavg | cut -d' ' -f1)

echo $LOADAVG1
