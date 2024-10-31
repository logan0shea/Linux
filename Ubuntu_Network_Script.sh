#!/bin/bash

#Set Date Variable, used for File Name later.
date=$(date +%Y-%m-%d)

#Select the output file, set this to avoid typing long file name each line.
file="Network_Status_$date.txt"

#Clear file.  In case the script needs to be run twice, clear the file to avoid duplicate output.
echo  > "$file"

#Show IP Address Info
ip addr show >> "$file"

#Show IP Routing info
ip route show >> "$file"

#Show Network Interface Config
ifconfig >> "$file"

#Show DNS Settings
cat /etc/resolv.conf >> "$file"

#Show Firewall status
sudo ufw status >> "$file"

#Check Open Ports
netstat -tuln >> "$file"

#Show Active Connections
ss -s >> "$file"

