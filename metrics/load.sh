#!/bin/bash
#load1
LOADAVG1=$(uptime | awk '{print $10}' | sed 's/,//')

echo $LOADAVG1
