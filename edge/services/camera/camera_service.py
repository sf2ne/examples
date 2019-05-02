from picamera import PiCamera
from os import abort
from flask import Flask,jsonify, request
from time import sleep, time
from sys import argv, exit
import base64

REST_API_BIND_ADDRESS = '0.0.0.0'
REST_API_BIND_PORT = 80
app = Flask('example')

camera = PiCamera()


@app.route('/api/get_snippet', methods=['GET'])
def get_snippet():
	n = time()
	filepath = take_picture(n)
	with open(filepath, 'rb') as f:
		contents = f.read()
	image_64_encode = base64.encodestring(contents)
	return image_64_encode, 201


def take_picture(n):
	try:
		filepath = '/image_'+str(n)+'.jpg'
	except:
		pass
	camera.resolution = (1024, 768)
	camera.capture(filepath)
	return filepath


def take_video():
	try:
		filepath = '/video_'+str(COUNT)+'.h264'
	except:
		pass
	camera.start_recording(filepath)
	sleep(5)
	camera.stop_recording()
	return filepath
	

if __name__== '__main__':
	app.run(host=REST_API_BIND_ADDRESS, port=REST_API_BIND_PORT)

	




