#!/bin/sh


#默认的账号和密码
user=$username":"$password


if [ ! -f "/usr/local/etc/turnserver.conf" ]; then
	cp /usr/local/etc/turnserver.conf.default  /usr/local/etc/turnserver.conf
	#更新外网ip(仅替换首次出现的external-ip)
	sed -i "1,/#external-ip=.*/{s/#external-ip=.*/external-ip\=$ExternalIp/g}" /usr/local/etc/turnserver.conf
	
	#修改用户名
	sed -i "1,/#user=.*/{s/#user=.*/user\=$user/g}" /usr/local/etc/turnserver.conf
	
	#修改real
	sed -i "1,/#realm=.*/{s/#realm=.*/realm\=$Realm/g}" /usr/local/etc/turnserver.conf
fi

#启动服务
nohup turnserver -L 0.0.0.0 -a -v -f 

while :
do
	sleep 1
done