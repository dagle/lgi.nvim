#!/bin/sh

DIR=$(dirname "$0")
BASEDIR=$(realpath "${DIR}")
git clone --depth 1 --single-branch https://github.com/lgi-devs/lgi "$BASEDIR/lgi" && rm -rf "$BASEDIR/lgi/.git"

make LUA_CFLAGS="$(pkg-config --cflags luajit) -O2" -f "$BASEDIR/lgi/Makefile"
make LUA_LIBDIR="$BASEDIR/lua" LUA_SHAREDIR="$BASEDIR/lua" -f "$BASEDIR/lgi/Makefile" install

rm -rf "$BASEDIR/lgi"
