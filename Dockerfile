FROM google/cloud-sdk:latest

MAINTAINER Cengiz Ilerler <cilerler@gmail.com>

RUN apt-get -qqy update \
     && apt-get -qqy install wget \
     && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb \
     && dpkg -i packages-microsoft-prod.deb \
     && apt-get -qqy update \
     && apt-get -qqy install powershell
