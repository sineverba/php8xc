FROM php:8.2.2-cli
# OpCache settings
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ENV XDEBUG_MODE="debug,coverage"
# Versions
ARG XDEBUG_VERSION=3.2.0
# Install system dependencies
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    libpq-dev
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Setup PHPXDebug
RUN pecl install xdebug-${XDEBUG_VERSION}
# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd opcache zip \
    && docker-php-ext-enable mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd xdebug
# Get latest Composer
COPY --from=composer:2.5.1 /usr/bin/composer /usr/bin/composer
# Add custom ini files
COPY config/10-shorttag.ini \
        config/20-memory-limit.ini \
        config/30-opcache.ini \
        config/40-xdebug.ini \      
        $PHP_INI_DIR/conf.d/
# Create folder
RUN mkdir -p /data
