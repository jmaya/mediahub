#!/bin/bash

# docker build -t jmaya/mediahub_app .
docker build -t home.lasamaria.com:30000/mediahub_app .
docker push home.lasamaria.com:30000/mediahub_app
#docker save jmaya/mediahub_app:latest | ssh -C jmaya@$1 docker load

#on docker host run
# docker-compose up -d
# docker-compose ps -q app |xargs docker inspect -f "server {{.NetworkSettings.IPAddress}}:3000;"
# and copy the output of the command to myapp.conf
# docker-compose restart web
