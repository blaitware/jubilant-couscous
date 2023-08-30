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

# Copy the source code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# # Start PHP-FPM
# CMD ["php-fpm"]

# Start the Laravel development server
CMD php artisan serve --host=0.0.0.0 --port=8000
