FROM ubuntu:jammy

ARG MAJOR_VERSION=6.2
ARG ZBX_VERSION=${MAJOR_VERSION}.4

ENV TERM=xterm \
    ZBX_VERSION=${ZBX_VERSION} \
    PATH=/usr/lib/go-1.18/bin:$PATH

RUN set -eux && \
    INSTALL_PKGS="bash \
            autoconf \
            automake \
            binutils \
            gcc \
            libc6-dev \
            libcurl4-openssl-dev \
            libevent-dev \
            libmodbus-dev \
            libldap2-dev \
            libmysqlclient-dev \
            libopenipmi-dev \
            libpcre2-dev \
            libsnmp-dev \
            libsqlite3-dev \
            libpq-dev \
            libssh-dev \
            libxml2-dev \
            make \
            openjdk-8-jdk-headless \
            pkg-config \
            gettext \
            git \
            golang-1.18 \
            unixodbc-dev" && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y \
            --no-install-recommends install \
        ${INSTALL_PKGS} && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80