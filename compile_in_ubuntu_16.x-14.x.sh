
#!/usr/bin/env bash
#! Installer Assumes you have a new VM or similiar that is online, has 2vcpus, 2GB RAM, Min 20GB HDD (60GB Recommended Min) and are logged in as root.
#! root user not recommended for production site.

apt-get update
apt-get upgrade
apt-get -y -f -qq install unzip devscripts autoconf automake libtool flex bison gperf gawk m4 make libssl-dev
apt-get -y update
apt-get install checkinstall build-essential automake autoconf libtool pkg-config libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev libevent-dev imagemagick
mkdir vos &&
cd vos &&
wget https://github.com/openlink/virtuoso-opensource/releases/download/v7.2.4.2/virtuoso-opensource-7.2.4.2.tar.gz &&
tar -xyz virtuoso-opensource-7.2.4.2.tar.gz &&

./autogen.sh &&

CFLAGS="-O2 -m64"
    export CFLAGS
    ./configure

./configure --enable-imagemagick --enable-php5=/usr/local/php5 --enable-wbxml2 --enable-perl --enable-python --with-internal-zlib --with-iodbc --enable-all-vads &&

checkinstall
