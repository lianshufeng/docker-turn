FROM centos:8

#更新依赖
RUN yum install -y wget curl unzip openssl-devel libevent-devel make gcc


#源码下载
RUN mkdir -p /tmp/dl && \
	cd /tmp/dl && \
	wget https://github.com/coturn/coturn/archive/master.zip -O coturn.zip && \
	unzip coturn.zip && \
	cd coturn-master && \
	./configure && \
	make && \
	make install &&\
	rm -rf /tmp/dl
	
#以守护者模式启动
RUN echo "TURNSERVER_ENABLED=1" > /etc/default/coturn	


#外网ip,仅在不挂载配置文件生效
ENV ExternalIp 127.0.0.1
ENV Realm test.com
ENV username xiaofeng
ENV password xiaofeng123



EXPOSE 3478
EXPOSE 3478/udp
EXPOSE 49152-65535/udp

#设置启动
COPY entrypoint.sh /entrypoint.sh
RUN chmod -R 777 /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]