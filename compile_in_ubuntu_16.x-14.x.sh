
#!/usr/bin/env bash
#! Installer Assumes you have a new VM or similiar that is online, has 2vcpus, 2GB RAM, Min 20GB HDD (60GB Recommended Min) and are logged in as root.
#! root user not recommended for production site.
apt-get update
apt-get upgrade
apt-get install software-properties-common
apt-get -y -f -qq install unzip devscripts autoconf automake libtool flex bison gperf gawk m4 make libssl-dev software-properties-common checkinstall build-essential automake autoconf libtool pkg-config libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev libevent-dev imagemagick
add-apt-repository ppa:ondrej/php
apt-get -y update
apt-get install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
git clone https://github.com/openlink/virtuoso-opensource.git "develop/7" &&
cd /develop/7/ &&

./autogen.sh &&

CFLAGS="-O2 -m64"
    export CFLAGS
    ./configure

./configure --enable-imagemagick --enable-php5=/usr/local/php5.6 --enable-wbxml2 --with-iodbc --enable-all-vads --enable-perl --enable-python --with-internal-zlib &&

Make

checkinstall
