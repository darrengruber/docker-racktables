FROM php:5-apache
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /racktables

RUN \
  apt-get update \
  && apt-get install -y php5-gd \
                        php5-mysql \
                        php5-snmp

COPY . /racktables

RUN \
  make install \
  && sed -i 's@/var/www/html@/usr/local/share/RackTables/wwwroot@g' /etc/apache2/sites-enabled/000-default.conf
