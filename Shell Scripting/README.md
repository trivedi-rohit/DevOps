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
```
#!/bin/bash
directory_to_backup="/home/rohit/Desktop/Romo/newScript"      # This directory will be backed up
backup_location="/home/rohit/Desktop/Romo"   # Here backup will be stored
current_date=$(date +%d-%m-%Y)               # Date on which the backup was taken

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
