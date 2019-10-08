#!/bin/bash

cd config

docker build -t project1 -f Dockerfile .
docker-compose up