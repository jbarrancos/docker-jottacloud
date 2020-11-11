FROM ubuntu:latest

MAINTAINER J.J.Barrancos

# Update packages and install software
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install gnupg2 \
    && apt-get -y install wget apt-transport-https ca-certificates \
    && wget -O - https://repo.jotta.us/public.gpg | apt-key add - \
    && echo "deb https://repo.jotta.us/debian debian main" | tee /etc/apt/sources.list.d/jotta-cli.list \
    && apt-get update \
    && apt-get -y install jotta-cli \
    && apt-get -y install expect

# Add volumes for backup folder and configuration directories
VOLUME ["/config"]
VOLUME ["/backup"]

# copy in files
ADD jottascripts/ /usr/local/jottad

# add execute permission
RUN chmod +x /usr/local/jottad/*

# Open port
EXPOSE 14443

#set environment
ENV JOTTA_TOKEN=[token] \
    JOTTA_DEVICE=[devicename] \
    JOTTA_SCAN=1h\
    PUID=101 \
    PGID=101 \
    LOCALTIME=/usr/share/zoneinfo/Europe/Amsterdam

# setup container and start service
ENTRYPOINT ["/usr/local/jottad/entrypoint.sh"]
