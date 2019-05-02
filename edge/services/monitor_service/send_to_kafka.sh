#!/usr/bin/env bash

export SAMPLE_BROKER='kafka04-prod02.messagehub.services.us-south.bluemix.net:9093,kafka02-prod02.messagehub.services.us-south.bluemix.net:9093,kafka01-prod02.messagehub.services.us-south.bluemix.net:9093,kafka05-prod02.messagehub.services.us-south.bluemix.net:9093,kafka03-prod02.messagehub.services.us-south.bluemix.net:9093'
export SAMPLE_APIKEY='xvj55vVXrVIdYX1pCVPLOya2nTHNSEnF4BHLimq5wMPg4zvg'
export SAMPLE_TOPIC='Sadiyah.Faruk_ibm.com.IBM_cpu2msghub'

#base64 $1 > image_in_bytes.txt

curl -sS 'http://camera/api/get_snippet' > bytes.txt

kafkacat  -b "${SAMPLE_BROKER}" -P \
    -X api.version.request=true \
    -X security.protocol=sasl_ssl \
    -X sasl.mechanisms=PLAIN \
    -X sasl.username=${SAMPLE_APIKEY:0:16} \
    -X sasl.password="${SAMPLE_APIKEY:16}" \
    -t "${SAMPLE_TOPIC}" bytes.txt

