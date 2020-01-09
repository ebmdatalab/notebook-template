#!/bin/bash

docker build -t custom-docker -f config/Dockerfile .
docker run -ti --mount source=${PWD},dst=/root,type=bind -p 8888:8888 custom-docker
