#!/bin/bash
cat /var/log/secure|awk '/Failed/{print $11}'|sort |uniq -c > /root/2.txt
while read line;do
	ip=$(echo $line|awk '{print $2}')
	num=$(echo $line|awk '{print $1}')
	if [ $num -gt 5 ];then
		echo "sshd:$ip" >> /etc/hosts.deny
		
	fi
	cat /etc/hosts.deny |sort |uniq|awk '{print > "/etc/hosts.deny"}'
done</root/2.txt
