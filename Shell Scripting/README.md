# Basic syntax for conditional If in bash scripting:
```bash
#!/bin/bash
my_value=2000
if [ $my_value -lt 2005 ]; then
	echo "The condition is True."
fi
```
_________________________________________________________________________________________________________________________________________________________________________________________________________________________
# Script to Backup a Directory  
```bash
#!/bin/bash
directory_to_backup="/home/rohit/Desktop/Romo/newScript"      # This directory will be backed up
backup_location="/home/rohit/Desktop/Romo"                    # Here backup will be stored
current_date=$(date +%d-%m-%Y)                                # Date on which the backup was taken

# Find the next available backup number
backup_number=1
while [ -f "$backup_location/backup-$backup_number-$current_date.tar.gz" ]; 
do
    backup_number=$((backup_number + 1))
done

# Create the backup with the new backup number
tar -czf "$backup_location/backup-$backup_number-$current_date.tar.gz" -C "$(dirname "$directory_to_backup")" "$(basename "$directory_to_backup")"

echo "Backup of $directory_to_backup is created successfully on $current_date as backup-$backup_number inside $backup_location."
```
# Updated:
```bash
#!/bin/bash

directory_to_backup=$1  
backup_location=$2

# Validate input arguments
if [ -z "$directory_to_backup" ] || [ -z "$backup_location" ]; then
    echo "Usage: $0 <directory_to_backup> <backup_location>"
    exit 1
fi

# current date
current_date=$(date +'%Y-%m-%d')

# Backup
tar -czf "$backup_location/backup-$current_date.tar.gz" -C "$(dirname "$directory_to_backup")" "$(basename "$directory_to_backup")"

echo "Backup of $directory_to_backup is created successfully on $current_date inside $backup_location."
```
Now provide desired backup path and backup location to create back of any directory.

Give permission to file => chmod +x UpdateBackupScript.sh

Then, => ./backup.sh /path of directorytobackup /path where to save backup
_________________________________________________________________________________________________________________________________________________________________________________________________________________________
# Check if command exist or not
```bash
#!/bin/bash
read -p "Enter a command to check : " cmd_name
# used "/dev/null" to avoid getting output of a command to be printed. So dumped in /dev/null.
if command  -v $cmd_name &> /dev/null ; then    
	echo "$cmd_name command exist"
else
	echo "$cmd_name doesn't exist"
fi
```
_________________________________________________________________________________________________________________________________________________________________________________________________________________________
# Count number of files in a directory till a single file exist else loop will exit
```bash
#!/bin/bash

directory_to_check=$1

#Till the time a directory is present, loop will keep on running.
while [ "$(ls -A $directory_to_check)"  ]
do
	file_count=$(ls -1 $directory_to_check | wc -l)
	echo "The file count in the $directory_to_check is $file_count"
	sleep 5
done
echo "Directory is empty now."
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________________
# System Health Check
```bash
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

echo "Information : Present CPU Usage is $CPU_USAGE% and Available Memory is $MEM_AVAILABLE%."
```
