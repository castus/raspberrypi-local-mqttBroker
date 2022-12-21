FROM arm32v7/ubuntu:22.04

WORKDIR /etc/mosquitto

#RUN apt-get update -y && apt-get upgrade -y && apt-get install -yq --no-install-recommends \
#    build-essential \
#    git \
#    unzip \
#    nano \
#    wget \
#    bzip2 \
#    ca-certificates \
#    locales \
#    libblas-dev \
#    liblapack-dev \
#    software-properties-common \
#    gpg-agent
#RUN apt-get clean && rm -rf /var/lib/apt/lists/*
#
#RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
#ENV LANG en_US.utf8
#
#RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
#RUN apt-get install -yq mosquitto mosquitto-clients
#
#COPY mosquitto.conf mosquitto.conf
#
#EXPOSE 1883
#
#CMD mosquitto -c /etc/mosquitto/mosquitto.conf

RUN apt-get update -y && apt-get upgrade -y && apt-get install -yq --no-install-recommends nano
