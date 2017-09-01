#!/bin/bash

docker build -t home.lasamaria.com:30000/mediahub_app .
docker push home.lasamaria.com:30000/mediahub_app
