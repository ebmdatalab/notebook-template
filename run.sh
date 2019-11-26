#!/bin/bash

docker build -t project1 -f config/Dockerfile .

docker-compose up