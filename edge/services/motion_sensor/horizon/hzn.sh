# Settings needed to build, publish, and run the Horizon nlp example edge service.
# This file will be automatically read by hzn and make.

# Change the variable values to your values:

# Set this to your org
HZN_ORG_ID=Sadiyah.Faruk@ibm.com

# An identifier for your service that is unique in your org
SERVICE_NAME=motion

# The current version of your service you are building/publishing
SERVICE_VERSION=0.0.1

# Change openhorizon to your docker hub id from https://hub.docker.com/ .
# ARCH and SERVICE_VERSION will be added to this when used.
DOCKER_IMAGE_BASE=sfaruk/motion
ARCH=arm

# Where to store your service signing keys. Only need to change these if you want to store them somewhere else.
# Note: the horizon/keys sub-directory is in .gitignore so it will not be committed to git
HZN_PRIVATE_KEY_FILE=horizon/keys/service.private.key
HZN_PUBLIC_KEY_FILE=horizon/keys/service.public.pem


# Soon this will not be needed
export HZN_ORG_ID SERVICE_NAME SERVICE_VERSION DOCKER_IMAGE_BASE ARCH HZN_PRIVATE_KEY_FILE HZN_PUBLIC_KEY_FILE