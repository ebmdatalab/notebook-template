#!/bin/bash

SET mypath=%~dp0

docker build -t custom-docker -f config/Dockerfile .
docker run -ti --mount source=%mypath:~0,-1%,dst=/root,type=bind -p 8888:8888 custom-docker
