FROM armv7/armhf-ubuntu_core:xenial

MAINTAINER Andrii Matasov <matasoffbusy@ukr.net>

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    g++ \
    libboost-dev \
    libprotobuf-dev \
    m4 \
    protobuf-compiler \
    python \
    wget

RUN wget http://download.rethinkdb.com/dist/rethinkdb-2.3.7.tgz \
    && tar -zxvf rethinkdb-2.3.7.tgz \
    && cd rethinkdb-2.3.7 \
    && ./configure --with-system-malloc --allow-fetch \
    && make \
    && make install

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

EXPOSE 28015 29015 8080
