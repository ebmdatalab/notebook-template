#!/bin/bash

SET mypath=%~dp0

docker build -t jupyter-docker -f config/Dockerfile .
docker run -ti --mount source=%mypath:~0,-1%,dst=/home/app/notebook,type=bind -p 8888:8888 jupyter-docker
