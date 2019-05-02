FROM resin/raspberry-pi-python:3
#FROM arm32v7/ubuntu:18.04

RUN apt-get update \
    && apt-get install -y curl ca-certificates wget jq bc python python-pip python-dev python-rpi.gpio git \
    && apt-get install libraspberrypi-bin -y \
    && pip install --no-cache --upgrade flask-restful \
    && pip install --no-cache --upgrade picamera 

COPY camera_service.py .
WORKDIR /
CMD [ "python", "./camera_service.py" ]
