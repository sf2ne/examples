sudo docker build -f Dockerfile -t monitor:latest .
sudo docker rm -f monitor 2>/dev/null || :
sudo docker run -d --privileged --name monitor --network=mynet monitor:latest
