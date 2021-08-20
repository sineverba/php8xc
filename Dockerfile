FROM php:8.0.9-cli

# OpCache settings
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ENV XDEBUG_MODE="debug,coverage"

# Install system dependencies
RUN apt-get update && apt-get install -y \
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
RUN pecl install xdebug-3.0.4

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd opcache zip \
    && docker-php-ext-enable mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd xdebug

# Get latest Composer
COPY --from=composer:2.1.5 /usr/bin/composer /usr/bin/composer

# Add custom ini files
COPY config/10-shorttag.ini \
        config/20-memory-limit.ini \
        config/30-opcache.ini \
        config/40-xdebug.ini \      
        $PHP_INI_DIR/conf.d/

# Create folder
RUN mkdir -p /data