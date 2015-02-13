FROM ubuntu:12.04
ADD sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php5-memcache\
        php-apc && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ADD ./composer.phar   /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer 

#rewrite
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/sites-available/000-default.conf
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD sample/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
