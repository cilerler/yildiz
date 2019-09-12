FROM google/cloud-sdk:latest

MAINTAINER Cengiz Ilerler <cilerler@gmail.com>

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
    && apt-get -qqy update \
    && apt-get install -qqy powershell
