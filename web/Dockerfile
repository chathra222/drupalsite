FROM ubuntu:16.04

#
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y apache2 wget tar

#VOLUME [./web/DocumentRoot:/var/www/html/]

#Install PHP
RUN apt-get install -y libapache2-mod-php php
RUN sed -i '/extension=msql.so/s/;//g' /etc/php/7.0/apache2/php.ini



# Install Composer
RUN apt-get install curl php-cli php-mbstring git php-xml unzip -y
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#install Drush
RUN composer global require drush/drush -v 8
RUN ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

#Download Drupal
WORKDIR /var/www/
RUN rm -rf html/
RUN wget https://www.drupal.org/download-latest/tar.gz
RUN tar -xf tar.gz
RUN mv $(ls|grep drupal)/ html
RUN chown -R root:www-data /var/www/html
RUN chmod 775 -R /var/www/html

WORKDIR /var/www/html/
RUN apt-get install php-gd -y
RUN apt-get install javascript-common libaio1 libjs-jquery libjs-sphinxdoc libjs-underscore libmcrypt4 libnuma1 mysql-client mysql-client-5.7 mysql-client-core-5.7 mysql-common php-gettext php-mcrypt php-mysql php-pear php-phpseclib php-tcpdf php7.0-mcrypt php7.0-mysql -y

RUN echo "ServerName localhost">/etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn.conf
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf

ADD apache2.conf /etc/apache2/apache2.conf

RUN /etc/init.d/apache2 restart
EXPOSE 8080

ENTRYPOINT ["apache2ctl","-DFOREGROUND"]
