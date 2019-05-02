export FLASK_APP=motion_sensor_service.py
sudo docker build -f Dockerfile -t motion:latest .
sudo docker rm -f motion 2>/dev/null || :
export HOST_TEST_PORT=8080
# docker run -d --name motion -p "${HOST_TEST_PORT}:80" server
# Thar be monsters here...
sudo docker run -d --privileged --name motion motion:latest
