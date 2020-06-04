#!/bin/bash

eval "$(ssh-agent -s)" &&
ssh-add -k ~/.ssh/id_rsa &&

source ~/.profile
echo "$DOCKER_PASSWORD" | docker login --username $DOCKER_USERNAME --password-stdin
docker stop backend
docker rm backend
docker rmi ian18ishar/alta:latest
docker run -d --name backend -p 5000:5000 ian18ishar/alta:latest
