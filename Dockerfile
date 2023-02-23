FROM --platform=$BUILDPLATFORM ubuntu:kinetic AS builder
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

RUN apt-get update -y && apt-get upgrade -y && apt-get install -yq --no-install-recommends \
    build-essential \
    git \
    unzip \
    nano \
    wget \
    bzip2 \
    ca-certificates \
    locales \
    libblas-dev \
    liblapack-dev \
    software-properties-common \
    gpg-agent
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG en_US.utf8

RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN apt-get install -yq mosquitto mosquitto-clients
RUN mkdir -m 777 /run/mosquitto/
WORKDIR /etc/mosquitto

COPY mosquitto.conf mosquitto.conf

FROM --platform=$BUILDPLATFORM builder
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

EXPOSE 1883

CMD mosquitto -c /etc/mosquitto/mosquitto.conf
