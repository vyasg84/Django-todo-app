#!/bin/bash 
echo "Removing existing directory"
rm -rf docker_python_jenkins
echo "Clone from GitHub"
git clone https://github.com/vyasg84/docker_python_jenkins.git
echo "removing image"
docker image rmi  vyasg84/jenkins-python-demo:1.0
echo "Pulling new image from DockerHub"
docker pull vyasg84/jenkins-python-demo:1.0
echo "Removing existing container on server"
docker rm -f docker_python_jenkins
echo "Creating new container on server"
sudo docker run -d --name docker_python_jenkins vyasg84/jenkins-python-demo:1.0
echo "Show Running container on server"
docker ps -a
