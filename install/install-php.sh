#!/bin/bash

PHP_VERSION=$1

sudo apt install php$PHP_VERSION
sudo apt install php$PHP_VERSION-fileinfo \
  php$PHP_VERSION-mbstring \
  php$PHP_VERSION-bcmath \
  php$PHP_VERSION-cli \
  php$PHP_VERSION-common \
  php$PHP_VERSION-dom \
  php$PHP_VERSION-curl \
  php$PHP_VERSION-gd \
  php$PHP_VERSION-intl \
  php$PHP_VERSION-mbstring \
  php$PHP_VERSION-opcache \
  php$PHP_VERSION-xml \
  php$PHP_VERSION-zip \
  php$PHP_VERSION-xdebug
