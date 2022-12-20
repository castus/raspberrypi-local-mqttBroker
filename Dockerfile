FROM arm32v7/ubuntu:22.04

WORKDIR /etc/mosquitto

RUN apt-get update && apt-get upgrade -y && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano \
    wget \
    bzip2 \
    ca-certificates \
    locales \
    libblas-dev \
    liblapack-dev \
    gfortran \
    software-properties-common \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN apt-get install -yq mosquitto mosquitto-clients

COPY mosquitto.conf mosquitto.conf

EXPOSE 1883

CMD mosquitto -c /etc/mosquitto/mosquitto.conf
