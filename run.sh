#!/bin/bash

docker build -t datalab-jupyter -f Dockerfile .
PID=$(docker run --detach --rm -ti --mount source=${PWD},dst=/home/app/notebook,type=bind --publish-all datalab-jupyter)
echo "Set up port mapping:"
docker port $PID
echo "Stop Jupyter using the File -> Shutdown menu option in Jupyterlab"
