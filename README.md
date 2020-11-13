# docker-turn

- docker-compose.yml
````shell
version: "3"
services:
  coturn:
    #生产模式，去掉build
    build:
      context: ./
      dockerfile: Dockerfile
    image: lianshufeng/coturn
    environment:
      #外网ip
      - ExternalIp=xx.xx.xx.xx
      - Realm=test.com
      - username=xiaofeng
      - password=xiaofeng123
    network_mode: "host"
    # volumes:
      # - "./turnserver.conf:/usr/local/etc/turnserver.conf"
    container_name: coturn
    restart: always
````
