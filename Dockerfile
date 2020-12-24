FROM google/cloud-sdk:latest

# install Powershell
RUN apt-get -qqy update \
     && apt-get -qqy install wget \
     && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb \
     && dpkg -i packages-microsoft-prod.deb \
     && apt-get -qqy update \
     && apt-get -qqy install powershell

# apt-get and system utilities
RUN apt-get -qqy update \
     && apt-get -qq -y install debconf-utils \
     && rm -rf /var/lib/apt/lists/*
 
# install SQL Server drivers and tools
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
     && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile \
     && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
     && /bin/bash -c "source ~/.bashrc"

