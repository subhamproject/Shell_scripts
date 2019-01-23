#!/bin/bash
## Script to monitor Memory and Filesystem usage on Server

LIMIT=10
LOG_FILE="/tmp/disk_util.txt"
RECIPIENTS="subham.rhce@gmail.com"

MEMORY()
{
DATE=`date +%c`
MEM_USED=`free -m  | awk -F' ' '/Mem/{printf "%.0f\n", $3/$2*100}'`
if [ "${MEM_USED}" -ge "${LIMIT}" ];then
echo -e "Team,\nMemory utilization is currently \"$MEM_USED%\" on server \"$(hostname)\" as on \"${DATE}\"" |mailx -s "Alert: Memory Threshold Breached on $(hostname)" -S "from=ReactorCX@jenkins.devops.lmvi.net"  "${RECIPIENTS}"
fi
}


FILESYSTEM ()
{
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom|boot' | awk '{ print $5 " " $6 " " $1 }' | while read output;
do
USED=$(echo $output | awk -F' ' '{printf "%.0f\n", $1}' )
partition=$(echo $output | awk '{ print $2 }' )
if [ "${USED}" -ge "${LIMIT}" ]; then
echo  "Following Partition Running out of space \"$partition ($USED%)\" on $(hostname) as on $(date)" >> /tmp/disk_util.txt
fi
done
}

MEMORY
FILESYSTEM && [ -s "${LOG_FILE}" ] && mailx -s "Alert: Almost Out of Disk Space on $(hostname)" -S "from=ReactorCX@jenkins.devops.lmvi.net"  "${RECIPIENTS}" < ${LOG_FILE} && rm -rf ${LOG_FILE}
