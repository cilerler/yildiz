FROM google/cloud-sdk:latest

RUN apt-get -qqy update \
    && apt-get -qqy install wget \
    && wget -q "https://packages.microsoft.com/config/$(. /etc/os-release && echo $ID/$VERSION_ID)/packages-microsoft-prod.deb" \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get -qqy update \
    && apt-get -qqy install powershell \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
