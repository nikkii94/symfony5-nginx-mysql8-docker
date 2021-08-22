FROM nginx:stable-alpine

ARG NGINX_HOST

ENV NGINX_HOST=$NGINX_HOST

RUN apk add bash openssl

COPY ./conf/openssl.cnf /etc/ssl/openssl.cnf
RUN sed -i -e "s/NGINX_HOST/$NGINX_HOST/g" /etc/ssl/openssl.cnf

RUN openssl genrsa -des3 -passout pass:NotSecure -out /etc/ssl/server.pass.key 2048
RUN openssl rsa -passin pass:NotSecure -in /etc/ssl/server.pass.key -out /etc/ssl/server.key
RUN rm /etc/ssl/server.pass.key

RUN openssl req -new -passout pass:NotSecure -key /etc/ssl/server.key -out /etc/ssl/server.csr \
    -subj "/C=HU/ST=Pest/L=Budapest/O=Symfony/CN=$NGINX_HOST" -config /etc/ssl/openssl.cnf
RUN openssl x509 -req -sha256 -days 365 -in /etc/ssl/server.csr -signkey /etc/ssl/server.key \
    -out /etc/ssl/server.crt -extensions v3_req -extfile /etc/ssl/openssl.cnf

ADD ./conf/nginx.conf /etc/nginx/

RUN rm /var/log/nginx/access.log /var/log/nginx/error.log