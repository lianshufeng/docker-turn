# docker-turn

- docker-compose.yml
````shell
version: "3"
services:
  coturn:
    image: lianshufeng/coturn
    environment:
      #外网ip
      - ExternalIp=xx.xx.xx.xx
      - username=xiaofeng
      - password=xiaofeng123
    ports:
      - "3478:3478"
      - "3478:3478/udp"
      - "49152:65535/udp"
    # volumes:
      # - "./turnserver.conf:/usr/local/etc/turnserver.conf"
    container_name: coturn
    restart: always
````
