#!/bin/bash

docker build -t jupyter-docker -f config/Dockerfile .
docker run -ti --mount source=${PWD},dst=/home/app/notebook,type=bind -p 8888:8888 jupyter-docker
