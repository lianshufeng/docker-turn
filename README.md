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
    ports:
      - "3478:3478"
      - "3478:3478/udp"
      - "49152:65535/udp"
    # volumes:
      # - "./turnserver.conf:/usr/local/etc/turnserver.conf"
    container_name: coturn
    restart: always
````
