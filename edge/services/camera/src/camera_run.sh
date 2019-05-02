export FLASK_APP=camera_service.py
sudo docker build -f Dockerfile -t camera:latest .
sudo docker rm -f camera 2>/dev/null || :
export HOST_TEST_PORT=8080
# docker run -d --name server -p "${HOST_TEST_PORT}:80" server
# Thar be monsters here...
sudo docker run -d -p 8081:80 --privileged --name camera camera:latest
