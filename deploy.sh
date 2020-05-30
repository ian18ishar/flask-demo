#!/bin/bash

eval "$(ssh-agent -s)" &&
ssh-add -k ~/.ssh/id_rsa &&
cd /alterra/www/flask-demo #helloworld
git pull

source ~/.profile
echo "$DOCKERHUB_PASS" | docker login --username $DOCKERHUB_USER --password-stdin
docker stop backend
docker rm backend
docker rmi ian18ishar/alta:latest
docker run -d --name backend -p 5000:5000 ian18ishar/alta:latest
