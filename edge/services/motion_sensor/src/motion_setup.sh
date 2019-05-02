sudo docker build -f Dockerfile -t motion:latest .
sudo docker rm -f motion 2>/dev/null || :
sudo docker network create mynet 2>/dev/null || :
sudo docker run -d -p 8080:80 --privileged --name motion --network=mynet --network-alias=motion motion:latest
