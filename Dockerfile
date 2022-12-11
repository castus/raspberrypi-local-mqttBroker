FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install software-properties-common -y
RUN apt-get install nano -y
RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN apt-get install -y mosquitto
RUN apt-get install -y mosquitto-clients

EXPOSE 1883

ENV LANG en_US.utf8

CMD mosquitto -c /etc/mosquitto/mosquitto.conf