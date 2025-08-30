#!/bin/bash

# Get CPU usage percentage
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d "." -f1)
CPU_USAGE=$((100 - CPU_IDLE))

# Get available memory percentage
MEM_AVAILABLE=$(free -h | grep "Mem" | awk '{print $7/$2*100}' | cut -d "." -f1)

# Get Time Stamp
TIME_STAMP=$(date +"%d-%m-%Y %H:%M:%S")

# Log File
LOG_FILE="system_health.log"

# Check CPU Usage
if [ "$CPU_USAGE" -gt 80 ]; then    
	echo "Alert: High CPU Usage - ${CPU_USAGE}% detected at ${TIME_STAMP}" >> $LOG_FILE
fi


# Check available memory
if [ "$MEM_AVAILABLE" -lt 20 ]; then   
	echo "Alert: Low Memory available - ${MEM_AVAILABLE}% at ${TIME_STAMP}" >> $LOG_FILE
fi


echo "Information : Present CPU Usage is $CPU_USAGE% and available memory is $MEM_AVAILABLE%."
