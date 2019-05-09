import requests
import os
import logging
from time import sleep


def send_to_kafka(image_path):
	command = "./send_to_kafka.sh " + image_path
	os.system(command)
	logging.info("sending to kafka")


def get_image_and_send_to_kafka():
	os.system("./send_to_kafka.sh")
	logging.info("sending to kafka")


def call_get_camera_snippet():
	filepath = 'image.txt'
	r = requests.get('http://camera/api/get_snippet')
	with open(filepath, 'w') as outfile:
		outfile.write(r)
	logging.info("image received and saved in " + filepath + "on monitor")
	send_to_kafka(filepath)
	

def check_motion():
	r = requests.get('http://motion/api/get_motion')
	resp_json = r.json()
	if resp_json['motion'] != 0: #this means there is motion
		# call_get_camera_snippet()
		get_image_and_send_to_kafka()
	else:
		logging.info("No motion")


if __name__== '__main__':
	while True:
		check_motion()
		sleep(5)

