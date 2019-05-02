FROM arm32v7/ubuntu:18.04

RUN apt-get update \
    && apt-get install -y curl ca-certificates wget jq bc python python-pip python-dev python-rpi.gpio git \
    && pip install --no-cache --upgrade flask-restful 

COPY motion_sensor_service.py .

WORKDIR /

CMD [ "python", "./motion_sensor_service.py" ]

