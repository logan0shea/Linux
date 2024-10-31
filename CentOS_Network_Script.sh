#!/bin/bash

#Set Date Variable, it is good practice to include the date in any script report.
date=$(date +%Y-%m-%d)

#Choose the file we are directing the report to, saves time when running multiple output commands.
file="Network_Status_$date.txt"

#Clear file before running script, in case the script needs to be run twice, clear out old data.
echo  > "$file"

#Show Interface Information
ifconfig >> "$file"

#Show DNS Settings
cat /etc/resolv.conf >> "$file"

#Show SSH Status
sudo cat /etc/ssh/sshd_config >> "$file"

#Show open ports
netstat -tuln >> "$file"

#Firewall Status 
sudo firewall-cmd --list-all >> "$file"

#List of Active Services 
systemctl list-units --type=service --state=running >> "$file"

#Show who is signed into the server
w >> "$file"

