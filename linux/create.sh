#!/bin/sh

TARGET_PATH=$1
APP_NAME=$2
APP_LONG_NAME=$3

if [ $# -ge 2 ]
then
    if [ -z "${APP_LONG_NAME}" ]; then
        APP_LONG_NAME="${APP_NAME} app server"
    fi
    if [ ! -d ${TARGET_PATH} ]; then
       mkdir -p ${TARGET_PATH}
    else
        echo "Error,dir ${TARGET_PATH} has bean exist!"
        exit 1;
    fi
    cp -a `dirname $0`/tpl/* ${TARGET_PATH}
    cd ${TARGET_PATH}
    sed -i "s/@app.name@/${APP_NAME}/g" conf/wrapper.conf
    sed -i "s/@app.name@/${APP_NAME}/g" bin/tomcat
    sed -i "s/@app.long.name@/${APP_LONG_NAME}/g" bin/tomcat
else
    echo "create.sh [target path] [app name] {app description}"
fi






