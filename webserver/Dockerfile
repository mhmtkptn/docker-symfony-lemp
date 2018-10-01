FROM ubuntu:14.04

LABEL version="1.0.0"
LABEL maintainer="Mehmet Kaptan - mhtkpt@gmail.com"

ARG TIMEZONE

RUN apt-get update && apt-get -y install \
    software-properties-common \
    python-software-properties \
    debian-archive-keyring \
    wget \
    curl \
    vim \
    aptitude \
    dialog \
    net-tools \
    iputils-ping \
    mcrypt \
    build-essential \
    tcl8.5 \
    unzip \
    openssl \
    cron \
    ca-certificates

RUN add-apt-repository ppa:nginx/stable \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" >> /etc/apt/sources.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

RUN apt-get update && apt-get -y install \
    nginx \
    php5.6-fpm \
    php5.6-cli \
    php5.6-mysql \
    php5.6-curl \
    php5.6-mcrypt \
    php5.6-gd \
    php5.6-intl \
    php5.6-xsl \
    php5.6-mcrypt\
    php5.6-xdebug \
    php5.6-common \
    php5.6-imagick \
    mysql-client \
    phpunit \
    libssl-dev \
    xz-utils \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer creates=/usr/local/bin/composer

RUN rm -rf \
    /etc/nginx/conf.d \
    /etc/nginx/sites-enabled \
    /etc/nginx/sites-available
ADD conf/*.conf /etc/nginx/

RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN sed -i '/daemonize /c daemonize = no' /etc/php/5.6/fpm/php-fpm.conf
RUN sed -i '/^pid /c pid = /run/php5.6-fpm.pid' /etc/php/5.6/fpm/php-fpm.conf
RUN sed -i '/error_log /c error_log = /proc/self/fd/2' /etc/php/5.6/fpm/php-fpm.conf
RUN sed -i '/^listen /c listen = 127.0.0.1:9000' /etc/php/5.6/fpm/pool.d/www.conf
RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php/5.6/fpm/pool.d/www.conf
RUN phpenmod curl gd intl json mysql mysqli opcache pdo pdo_mysql mcrypt xdebug xsl

WORKDIR /var/www/symfony

COPY ./entrypoint.sh /etc/entrypoint.sh
RUN chmod ugo+x /etc/entrypoint.sh
ENTRYPOINT ["/etc/entrypoint.sh"]