
FROM php:8.2 AS builder

COPY config.json /config.json

COPY build-entrypoint.sh /build-entrypoint.sh
RUN chmod +x /build-entrypoint.sh

FROM php:8.2-apache AS main


CMD [ "apache2-foreground" ]
