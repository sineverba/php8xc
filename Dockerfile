ARG COMPOSER_VERSION
ARG PHP_VERSION
FROM composer:$COMPOSER_VERSION AS composer_downloader
FROM php:$PHP_VERSION-cli
# Versions
ARG XDEBUG_VERSION
# OpCache settings
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ENV XDEBUG_MODE="debug,coverage"
# Install system dependencies
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    libpng-dev \
    libonig-dev \
    libpq-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    zip
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Setup PHPXDebug
RUN pecl install xdebug-$XDEBUG_VERSION
# Install PHP extensions
RUN docker-php-ext-install \
        bcmath \
        exif \
        gd \
        mbstring \
        mysqli \
        opcache \
        pcntl \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        soap \
        zip \
    && docker-php-ext-enable \
        bcmath \
        exif \  
        gd \  
        mbstring \
        mysqli \
        pcntl \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        soap \
        xdebug
# Get latest Composer
COPY --from=composer_downloader /usr/bin/composer /usr/bin/composer
# Add custom ini files
COPY config/10-shorttag.ini \
        config/20-memory-limit.ini \
        config/30-opcache.ini \
        config/40-xdebug.ini \      
        $PHP_INI_DIR/conf.d/
# Create folder
RUN mkdir -p /data
