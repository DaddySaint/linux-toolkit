!#/bin/bash
#Monitoring Script for CPU, MEMORY AND DISK USAGE LOGS.

LOG_FILE="/var/log/system_monitor.log"

touch "$LOG_FILE"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

#METRIC LOGS

#CPU LOAD 
CPU_LOAD=$(uptime | awk -F'load average: ' 'print{$2}' | cut -d, -f1)

#MEMORY USAGE
MEM_INFO=$(free -m | awk '/^Mem:/ {print $3 "/" $2 "MB"}')

#DISK USAGE

DISK_USAGE=$(df -h / \ awk 'NR==2 {print $5}')

#Logging
echo "TIMESTAMP | CPU Load: $CPU_LOAD | Memory: $MEM_INFO | Disk Used : $DISK_USAGE >> "$LOG_FILE"

