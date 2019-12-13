FROM bitnami/minideb-extras:stretch-r494
LABEL maintainer "Sarra FOTSO <djuissimichielsarra@gmail.com>"

# Install required system packages and dependencies
RUN install_packages cron libbz2-1.0 libc6 libcomerr2 libcurl3 libexpat1 libffi6 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgssapi-krb5-2 libhogweed4 libicu57 libidn11 libidn2-0 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 liblzma5 libmemcached11 libmemcachedutil2 libncurses5 libnettle6 libnghttp2-14 libp11-kit0 libpcre3 libpng16-16 libpq5 libpsl5 libreadline7 librtmp1 libsasl2-2 libsqlite3-0 libssh2-1 libssl1.0.2 libssl1.1 libstdc++6 libsybdb5 libtasn1-6 libtidy5 libtinfo5 libunistring0 libxml2 libxslt1.1 libzip4 zlib1g
RUN bitnami-pkg unpack apache-2.4.41-3 --checksum 4cbd05e6df93361999856d4f77a4124443bc11b47abb090b3cfd19544cce627c
RUN bitnami-pkg unpack php-7.3.12-0 --checksum 017d386f054ac1752531dda9344f65bb903b85cbb6e70420b41ef5256b82ff80
RUN bitnami-pkg unpack mysql-client-10.1.43-0 --checksum 7b4dce9c8a619e8af1b67a3df57f66bfd8d336bc1a38e7076a9b15a9b983f2d1
RUN bitnami-pkg install libphp-7.3.12-0 --checksum 7ec2d2d73c6f945b16f00ee8f76639d894c4e5123b7f51095e0cbd84015dc2cf
RUN bitnami-pkg unpack moodle-3.8.0-0 --checksum 5391b4c394346c48fe082c4c1ece54e9a7fccd04c562d1175748a7d316f95ba9
RUN sed -i -e '/pam_loginuid.so/ s/^#*/#/' /etc/pam.d/cron

RUN echo "ServerName localhost" >> /opt/bitnami/apache/conf/httpd.conf

COPY rootfs /
ENV ALLOW_EMPTY_PASSWORD="yes" \
    BITNAMI_APP_NAME="moodle" \
    BITNAMI_IMAGE_VERSION="3.8.0-debian-9-r2" \
    MARIADB_HOST="mariadb" \
    MARIADB_PORT_NUMBER="3306" \
    MARIADB_ROOT_PASSWORD="" \
    MARIADB_ROOT_USER="root" \
    MOODLE_DATABASE_NAME="db_moodle" \
    MOODLE_DATABASE_PASSWORD="" \
    MOODLE_DATABASE_USER="bn_moodle" \
    MOODLE_EMAIL="djuissimichielsarra@gmail.com" \
    MOODLE_LANGUAGE="en" \
    MOODLE_PASSWORD="pass" \
    MOODLE_SITENAME="ZDD MOODLE" \
    MOODLE_SKIP_INSTALL="no" \
    MOODLE_USERNAME="sarra" \
    MYSQL_CLIENT_CREATE_DATABASE_NAME="" \
    MYSQL_CLIENT_CREATE_DATABASE_PASSWORD="" \
    MYSQL_CLIENT_CREATE_DATABASE_PRIVILEGES="ALL" \
    MYSQL_CLIENT_CREATE_DATABASE_USER="" \
    PATH="/opt/bitnami/apache/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:/opt/bitnami/mysql/bin:$PATH" \
    SMTP_HOST="smtp.gmail.com" \
    SMTP_PASSWORD="mypass" \
    SMTP_PORT="587" \
    SMTP_PROTOCOL="tls" \
    SMTP_USER="djuissimichielsarra@gmail.com"

EXPOSE 80 443

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "/run.sh" ]
