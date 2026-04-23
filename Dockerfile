# just using this image because it's the same one
FROM php:8.2-apache AS builder

COPY config.json /config.json


RUN apt update -y

RUN apt install -y python3.13-venv
RUN apt install -y libmariadb-dev python3-virtualenv pip

RUN mkdir -p /opt/init_py
RUN python3 -m venv /opt/init_py

WORKDIR /opt/init_py

RUN /opt/init_py/bin/pip install mariadb

COPY init_py/initialise_db.py /opt/init_py/initialise_db.py

COPY build-entrypoint.sh /build-entrypoint.sh
RUN chmod +x /build-entrypoint.sh

FROM php:8.2-apache AS main

CMD [ "apache2-foreground" ]
