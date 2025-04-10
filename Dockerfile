# Stage 1: Base image with PHP and system dependencies
ARG PHP_VERSION=8.4.5
ARG XDEBUG_VERSION=3.4.2
ARG COMPOSER_VERSION=2.8.8
FROM php:${PHP_VERSION}-cli AS base

ARG XDEBUG_VERSION

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ENV XDEBUG_MODE="debug,coverage"

# Install system dependencies and PHP extensions
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl \
    git \
    libpng-dev \
    libonig-dev \
    libpq-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    zip \
    && docker-php-ext-install \
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
    && pecl install xdebug-${XDEBUG_VERSION} \
    && docker-php-ext-enable \
        xdebug \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Stage 2: Composer downloader
FROM composer:${COMPOSER_VERSION} AS composer_downloader

# Stage 3: Final image
FROM base AS final

# Copy Composer binary
COPY --from=composer_downloader /usr/bin/composer /usr/bin/composer

# Copy custom PHP config files
COPY config/10-shorttag.ini \
     config/20-memory-limit.ini \
     config/30-opcache.ini \
     config/40-xdebug.ini \
     $PHP_INI_DIR/conf.d/

# Create app folder
RUN mkdir -p /data
