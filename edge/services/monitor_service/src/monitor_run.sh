sudo docker build -f Dockerfile -t monitor:latest .
sudo docker rm -f monitor 2>/dev/null || :
sudo docker run -d --privileged -e MSGHUB_BROKER_URL='$MSGHUB_BROKER_URL' -e MSGHUB_API_KEY='$MSGHUB_API_KEY' -e MSGHUB_TOPIC='$MSGHUB_TOPIC' --name monitor --network=mynet monitor:latest
