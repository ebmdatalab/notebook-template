#!/bin/bash

SET mypath=%~dp0

docker build -t custom-docker -f config/Dockerfile .
docker run -ti -v %mypath:~0,-1%:/root -p 8888:8888 custom-docker
