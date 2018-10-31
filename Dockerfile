#
# Based on Debian/Ubuntu
# https://github.com/joomla/docker-joomla/blob/472c2d0db79afdbd0e7515728a998c01c6a6a81d/php5.6/apache/Dockerfile
#
FROM joomla:3.8-php5.6-apache
LABEL maintainer "Cheewai Lai <cheewai.lai@gmail.com>"

ARG DOCKERIZE_VERSION=v0.6.1
RUN apt-get update \
 && apt-get install -y wget \
 && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && apt-get -y install \
    perl \
    libcyrus-imap-perl \
    cpanminus \
    build-essential \
 && a2enmod authnz_ldap cgi

ADD install-perlmodules.sh /
RUN /install-perlmodules.sh

# && apt-get -y remove --purge wget \
# && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
