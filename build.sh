#! /usr/bin/env bash

set -e

VERSION=3.0.2
FILENAME=redis-$VERSION.tar.gz
wget -O $FILENAME.tar.gz http://download.redis.io/releases/redis-$VERSION.tar.gz
tar xvf $FILENAME.tar.gz
cd "$FILENAME" 
time make CFLAGS="-static" EXEEXT="-static" LDFLAGS="-I/usr/local/include/"

cp_upx(){
    cp "$1" "$1.upx"
    upx "$1.upx"
}

( cd "src"; cp_upx "redis-server"; cp_upx "redis-cli"; )


