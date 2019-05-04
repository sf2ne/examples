#!/usr/bin/env bash

#base64 $1 > image_in_bytes.txt

curl -sS 'http://camera/api/get_snippet' > bytes.txt

kafkacat  -b "${MSGHUB_BROKER_URL}" -P \
    -X api.version.request=true \
    -X security.protocol=sasl_ssl \
    -X sasl.mechanisms=PLAIN \
    -X sasl.username=${MSGHUB_API_KEY:0:16} \
    -X sasl.password="${MSGHUB_API_KEY:16}" \
    -t "${MSGHUB_TOPIC}" bytes.txt

