#!/bin/sh

sed -i 's/^#define QT_NO_IMAGEFORMAT_JPEG/\/\/#define QT_NO_IMAGEFORMAT_JPEG/' /usr/include/qt5/QtGui/qtgui-config.h
sed -i 's/^#define QT_LINKED_OPENSSL/\/\/#define QT_LINKED_OPENSSL/' /usr/include/qt5/QtNetwork/qtnetwork-config.h
