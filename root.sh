#!/system/bin/sh

tmpdir="/data/local/tmp"

mount -o remount,rw /system 
mkdir -p /data/local/tmp
  if ls $tmpdir/su>>/data/local/tmp/log.txt;then cat $tmpdir/su>/system/xbin/su;chmod 6755 /system/xbin/su ;fi
  if ls $tmpdir/busybox>>/data/local/tmp/log.txt;then cat $tmpdir/busybox>/system/xbin/busybox;chmod 0755 /system/xbin/busybox ;/system/xbin/busybox --install /system/xbin;fi
  if ls $tmpdir/Superuser.apk >>/data/local/tmp/log.txt;then cat $tmpdir/Superuser.apk>/system/app/Superuser.apk;chmod 0644 /system/app/Superuser.apk ;fi
rm -r /data/local/tmp/*

