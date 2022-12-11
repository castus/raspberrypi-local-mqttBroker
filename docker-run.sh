#!/bin/bash

docker run \
  --rm \
  --name raspberrypi-local-mqttBroker \
  -itd \
  -p 1883:1883 \
  -v "$(pwd)"/mosquitto:/etc/mosquitto \
  --net mqtt-network \
  raspberrypi-local-mqttBroker-img
