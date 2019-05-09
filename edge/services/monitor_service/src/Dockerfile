FROM arm32v7/ubuntu:18.04

RUN apt-get update \
    && apt-get install -y curl ca-certificates wget jq bc python python-pip python-dev python-rpi.gpio git \
    && pip install --no-cache --upgrade flask-restful \
    && apt-get install kafkacat -y \
    && apt-get install curl -y \
    && pip install --no-cache --upgrade requests

COPY monitor_service.py .
COPY send_to_kafka.sh .

RUN ["chmod", "+x", "send_to_kafka.sh"]

WORKDIR /

CMD [ "python", "./monitor_service.py" ]
