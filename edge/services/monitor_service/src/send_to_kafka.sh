#!/usr/bin/env bash

#base64 $1 > image_in_bytes.txt

curl -sS 'http://camera/api/get_snippet' > bytes.txt

kafkacat  -b "${SAMPLE_BROKER}" -P \
    -X api.version.request=true \
    -X security.protocol=sasl_ssl \
    -X sasl.mechanisms=PLAIN \
    -X sasl.username=${SAMPLE_APIKEY:0:16} \
    -X sasl.password="${SAMPLE_APIKEY:16}" \
    -t "${SAMPLE_TOPIC}" bytes.txt

