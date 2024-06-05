FROM webdevops/php-nginx:8.2

EXPOSE 80 443 5353

LABEL Author="kmartin"
LABEL Project="zzspk"
LABEL Service="api-tester"

RUN apt update \
&& apt-get install -y \
    nano \
    libpng-dev npm

RUN mkdir /var/log/nginx/

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

#ENV WEB_DOCUMENT_ROOT=/app/public
#ENV PHP_DISMOD=bz2,calendar,exiif,ffi,intl,gettext,ldap,mysqli,imap,pdo_pgsql,pgsql,soap,sockets,sysvmsg,sysvsm,sysvshm,shmop,xsl,zip,gd,apcu,vips,yaml,imagick,mongodb,amqp

RUN npm install -g n
COPY --chown=application:application code/apiTester /app
COPY --chown=application:application code/fastcgi_params /etc/nginx
COPY --chown=application:application code/apiTester-nginx.conf /etc/nginx/conf.d
COPY --chown=application:application code/nginx.conf /etc/nginx/

COPY code/httpd-foreground /usr/local/bin
RUN # chown -R www-data:www-data /var/www/html/tygeris-manager/*
RUN # chown -R www-data:www-data /var/www/html/tygeris-manager/* &&  \
    chmod 775 -R /app/* \
    && chmod 775 -R /app/.*
WORKDIR /app

ENTRYPOINT httpd-foreground
#CMD supervisord