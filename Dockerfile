FROM php:7-fpm
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
  && docker-php-ext-configure gd  \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --enable-zip \
  && docker-php-ext-install -j$(nproc) gd  \
  && docker-php-ext-install -j$(nproc) zip 

