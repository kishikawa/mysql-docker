FROM mysql:8.1.0-debian
RUN apt-get update && \
    apt-get install -y locales
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
ADD ./volumes/mysql/etc/conf.d/my.cnf /etc/mysql/conf.d/my.cnf

FROM phpmyadmin:latest

COPY ./.htaccess /var/www/html/.htaccess
COPY ./.htpasswd /var/www/html/.htpasswd