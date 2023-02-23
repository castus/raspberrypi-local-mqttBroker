#!/bin/bash

docker run \
  --name raspberrypi-local-mqttBroker \
  -itd \
  -p 1883:1883 \
  --net mqtt-network \
  c4stus/raspberrypi:mqttbroker
