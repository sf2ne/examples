sudo docker build -f Dockerfile -t camera:latest .
sudo docker rm -f camera 2>/dev/null || :
sudo docker network create mynet 2>/dev/null || :
sudo docker run -d -p 8081:80 --privileged --name camera --network=mynet --network-alias=camera camera:latest
