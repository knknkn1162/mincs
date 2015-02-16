#!/bin/sh
PREFIX=/usr/local
LIBEXEC=$PREFIX/libexec
BIN=$PREFIX/bin

BINS="minc marten polecat"
LIBS="libexec/*"

modify_install() { # bin target
  echo "Install $1 into $2"
  cat $1 | sed -e 's%^LIBEXEC=.*$%LIBEXEC='$LIBEXEC%g > $2
  chmod 755 $2
  chown root:root $2
}

for i in $BINS; do
  modify_install $i $BIN/$i
done
for i in $LIBS; do
  modify_install $i $PREFIX/$i
done
