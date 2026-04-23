
FROM php:8.2 AS builder

COPY config.json /config.json

COPY docker-build.sh /docker-build.sh
RUN chmod +x /docker-build.sh

RUN /docker-build.sh

FROM php:8.2-apache AS main

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

#RUN /docker-entrypoint.sh

#CMD [ "apache2-foreground" ]
