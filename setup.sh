#!/bin/sh

BASE=/userconfig
BIN=$BASE/bin

echo "Checking apps..."
[ -f $BIN/busybox ] || { echo "$BIN/busybox not found"; exit 1; }
[ -f $BIN/dropbear ] || { echo "$BIN/dropbear not found"; exit 1; }
[ -x $BIN/busybox ] || chmod +x $BIN/busybox
[ -x $BIN/dropbear ] || chmod +x $BIN/dropbear
for i in `$BIN/busybox --list`; do [ -f $BIN/$i ] || ln -s busybox $BIN/$i; done
for i in dropbearkey scp ssh; do [ -f $BIN/$i ] || ln -s dropbear $BIN/$i; done
mount | grep -q /usr/bin || mount -o bind $BASE/bin /usr/bin

echo "Checking configs..."
if [ ! -d $BASE/etc ]; then
  cp -a /etc $BASE
  mkdir -p $BASE/etc/dropbear
  dropbearkey -t rsa -f $BASE/etc/dropbear/dropbear_rsa_host_key
  dropbearkey -t dss -f $BASE/etc/dropbear/dropbear_dss_host_key
  chmod 700 $BASE/etc/dropbear
  chmod 600 $BASE/etc/dropbear/*
fi
mount | grep -q /etc || mount -o bind $BASE/etc /etc

echo "Running SSH server..."
dropbear

echo "Done, type 'passwd' to change root password."
