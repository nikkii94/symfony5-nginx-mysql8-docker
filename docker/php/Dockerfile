ARG PHP_VERSION
ARG PHP_FROM="php:$PHP_VERSION-fpm"

FROM $PHP_FROM

ARG APP_ENV
ARG PROJECT_ROOT

RUN apt-get update && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR $PROJECT_ROOT

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# create composer cache directory
RUN mkdir -p /var/www/.composer && chown -R www-data /var/www/.composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony