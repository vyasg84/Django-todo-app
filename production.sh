#!/bin/bash 
echo "Removing existing directory"
rm -rf Django-todo-jenkins
echo "Clone from GitHub"
git clone https://github.com/vyasg84/Django-todo-app.git
echo "removing image"
docker image rmi  vyasg84/djnago-todo-app:1.0
docker image rmi  vyasg84/nginx-todo:1.0
echo "Pulling new image from DockerHub"
docker pull vyasg84/djnago-todo-app:1.0
docker pull vyasg84/nginx-todo:1.0
cd Django-todo-jenkins
echo "Creating new container on server"
docker-compose up
echo "Show Running container on server"
docker ps -a
