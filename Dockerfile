FROM php:8.1.2-apache

WORKDIR /code

COPY --chown=root:root config.sh /
RUN chmod 775 /config.sh

RUN apt-get update -y && apt-get install -y \
    openssl \
    zip \
    unzip \
    git \
    build-essential \
    libzip-dev \
    libpng-dev \
    libpq-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    git \
    nano \
    curl
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Install extensions
RUN docker-php-ext-install pdo pdo_pgsql pgsql zip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \ 
    docker-php-ext-install gd && \
    ln -fs /usr/share/zoneinfo/America/Rio_Branco /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt update && \
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && \
    apt install -y ca-certificates \
                   apt-transport-https \
                   lsb-release \
                   gnupg2 \
                   ntp \
                   curl \
                   locales && \
    locale-gen && \
    apt -y update && \
    apt -y install nano && \
    ntpd -q -g && \
    rm -rf /var/lib/apt/lists/* && \
    apt upgrade -y && \
    apt autoremove -y && \
    apt clean && \
    chmod 777 -R /code &&\
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY apache2/apache2.conf /etc/apache2/apache2.conf
COPY apache2/php.ini /usr/local/etc/php
COPY apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
# COPY config.sh /

RUN a2enmod rewrite

CMD [ "/config.sh" ]
