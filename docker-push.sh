#!/bin/bash

docker buildx build --platform linux/arm/v7,linux/arm64 --push -t c4stus/raspberrypi:mqttbroker .

