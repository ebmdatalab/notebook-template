#!/bin/bash

docker build -t custom-docker -f config/Dockerfile .
docker run -ti -v ${PWD}:/root -p 8888:8888 custom-docker
