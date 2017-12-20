#!/bin/sh
# Please run this script as root.

SYSTEM=`uname -s`

if [ -s /etc/redhat-release ]; then
        cd dpdk
        make install T=x86_64-native-linuxapp-gcc DESTDIR=./
        cd ../spdk
        ./configure --with-dpdk=./dpdk/x86_64-native-linuxapp-gcc
        make
elif [ -f /etc/debian_version ]; then
        cd dpdk
        make install T=x86_64-native-linuxapp-gcc DESTDIR=./
        cd ../spdk
        ./configure --with-dpdk=./dpdk/x86_64-native-linuxapp-gcc
        make
elif [ $SYSTEM = "FreeBSD" ] ; then
        cd dpdk
        gmake install T=x86_64-native-linuxapp-gcc DESTDIR=./
        cd ../spdk
        ./configure --with-dpdk=./dpdk/x86_64-native-linuxapp-gcc
        gmake