#!/bin/bash

docker buildx build --platform linux/arm/v7 --push -t c4stus/raspberrypi:mqttbroker .
