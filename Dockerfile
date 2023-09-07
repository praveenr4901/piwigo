FROM php:7.2-apache

# Installing necessary tools and PHP extensions
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
    gd \
    json \
    mbstring \
    intl \
    mysqli \
    xml \
    zip

WORKDIR /var/www/html

# Copy configurations
COPY php.ini /etc/php/7.2/apache2/php.ini
COPY piwigo.conf /etc/apache2/sites-available/piwigo.conf
#COPY database.inc.php /var/www/html/piwigo/local/config

# Enable necessary Apache mods and site configuration
RUN a2enmod rewrite \
    && a2ensite piwigo.conf \
#    && service apache2 restart

# Download, unzip, and set permissions for Piwigo
RUN curl -o piwigo.zip http://piwigo.org/download/dlcounter.php?code=latest \
    && unzip piwigo.zip \
    && chown -R www-data:www-data ./piwigo \
    && chmod -R 755 ./piwigo \
    && rm piwigo.zip

EXPOSE 80

CMD ["apache2-foreground"]

