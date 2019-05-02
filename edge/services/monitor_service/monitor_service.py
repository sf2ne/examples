import requests
import os
from subprocess import call
from shlex import split
from time import sleep


def send_to_kafka(image_path):
	command = "./send_to_kafka.sh " + image_path
	os.system(command)
	print("sent to subprocess")


def get_image_and_send_to_kafka():
	os.system("./send_to_kafka.sh")
	print("sent to subprocess")


def call_get_camera_snippet():
	filepath = 'image.txt'
	r = requests.get('http://camera/api/get_snippet')
	with open(filepath, 'w') as outfile:
		outfile.write(r)
	print(filepath)
	send_to_kafka(filepath)
	

def check_motion():
	r = requests.get('http://motion/api/get_motion')
	resp_json = r.json()
	if resp_json['motion'] != 0: #this means there is motion
		# call_get_camera_snippet()
		get_image_and_send_to_kafka()
	else:
		print('No motion')

	

if __name__== '__main__':
	while True:
		check_motion()
		sleep(5)

	
