#!/bin/bash

docker build -t custom-docker -f config/Dockerfile .
docker run -ti -v ${PWD}:/usr/local/bin/custom-docker -p 8888:8888 custom-docker