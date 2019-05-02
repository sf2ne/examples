import RPi.GPIO as GPIO
from time import sleep
from flask import Flask,jsonify, request

REST_API_BIND_ADDRESS = '0.0.0.0'
REST_API_BIND_PORT = 80
app = Flask(__name__)
SENSOR_PIN = 23

GPIO.setmode(GPIO.BCM)
GPIO.setup(SENSOR_PIN, GPIO.IN)


@app.route('/api/get_motion', methods=['GET'])
def ping_sensor_for_motion():
	i = GPIO.input(SENSOR_PIN)
	# is_motion = (i!=0)
	return jsonify({'motion': i}), 201


if __name__== '__main__':
	app.run(host=REST_API_BIND_ADDRESS, port=REST_API_BIND_PORT)
