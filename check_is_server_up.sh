#!/bin/bash

recipient="smandal@gmail.com"
servers=("10.0.0.17" "10.0.0.18")
subject="Alert: Jenkins Slave Status"
whom="jenkins.subham.lmvi.net"


function remote() {
ssh $1 'hostname' >> /dev/null
command_status=$?
if [ "${command_status}" -eq "0" ];then
/usr/bin/expect << EOF
set timeout 10
spawn ssh -q $1
expect  "(yes/no)?"  { send "yes\r" }
expect "$ " { send "sudo su -\r" }
expect "# " { send "yum install dos2unix -y\r" }
expect "# " { send "exit\r" }
EOF
elif [ "${command_status}" -ne "0" ];then
echo "Jenkins $2 slave is down,or may be spot fleet is renewed,Please check!" |mailx -s "${subject}" -S "from=${whom}" "${recipient}"
fi
}

for server in ${servers[@]}
do
case $server in
'10.0.0.17')
remote 10.0.0.17 primary
;;
'10.0.0.18')
remote 10.0.0.18 secondary
;;
esac
done
