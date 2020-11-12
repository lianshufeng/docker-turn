#!/bin/sh

if [ ! -f "/usr/local/etc/turnserver.conf" ]; then
	cp /usr/local/etc/turnserver.conf.default  /usr/local/etc/turnserver.conf
	#更新外网ip(仅替换首次出现的external-ip)
	sed -i "1,/#external-ip=.*/{s/#external-ip=.*/external-ip\=$ExternalIp/g}" /usr/local/etc/turnserver.conf
	

	#默认的账号和密码
	user=$username":"$password
	sed -i "1,/#user=.*/{s/#user=.*/user\=$user/g}" /usr/local/etc/turnserver.conf


fi


#turnserver -L 0.0.0.0 -a -u xiaofeng:123456 -v -f 


#nohup turnserver -o -a -f -user=xiaofeng:123456 -r xiaofengturn 

#turnserver -o -a -f -user=xiaofeng:123456 -r xiaofengturn 

#ps -elf


nohup turnserver -o -c /usr/local/etc/turnserver.conf



while :
do
	sleep 1
done