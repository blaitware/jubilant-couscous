# Use an official PHP runtime as the base image
FROM php:8.1-fpm

# Set the working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    unzip

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr


# Copy the source code into the container
COPY . .

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1


RUN composer install

# Expose the port the app runs on
EXPOSE 8000

# # Start PHP-FPM
# CMD ["php-fpm"]

# Start the Laravel development server
CMD php artisan serve --host=0.0.0.0 --port=8000
