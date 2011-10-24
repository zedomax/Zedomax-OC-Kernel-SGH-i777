#!/system/bin/sh

# Do Customizations

# Remount filesystems RW

busybox mount -o remount,rw /
busybox mount -o remount,rw /system


#Zedomax - Symlink bootanimation.zip
busybox ln -s /system/media/bootanimation.zip /system/media/sanim.zip
# Install BusyBox 1.18

/sbin/busybox --install -s /system/bin
# /sbin/busybox --install -s /sbin
sync

# Enable init.d support

if [ -d /system/etc/init.d ]
then
        logwrapper busybox run-parts /system/etc/init.d
fi
sync

# Fix screwy ownerships

# for blip in conf default.prop fota.rc init init.goldfish.rc init.rc init.smdkc110.rc lib lpm.rc modules recovery.rc res sbin
# do
#       chown root.system /$blip
#       chown root.system /$blip/*
# done

# chown root.system /lib/modules/*
# chown root.system /res/images/*


#if [ ! -f "/system/xbin/su" ]; then
rm /system/bin/su
rm /system/xbin/su
chmod 6755 /sbin/su
cp /sbin/su /system/bin/.
rm /sbin/su
#cp /sbin/su /system/xbin/.
#ln -s /sbin/su /system/bin/su
#ln -s /sbin/su /system/xbin/su
#fi

#setup proper passwd and group files for 3rd party root access
# Thanks DevinXtreme

if [ ! -f "/system/etc/passwd" ]; then
        echo "root::0:0:root:/data/local:/system/bin/sh" > /system/etc/passwd
        chmod 0666 /system/etc/passwd
fi
if [ ! -f "/system/etc/group" ]; then
        echo "root::0:" > /system/etc/group
        chmod 0666 /system/etc/group
fi

#ensure Superuser is installed to protect root access

#if [ ! -f "/system/app/Superuser.apk" -a ! -f "/data/app/Superuser.apk" ]; then
       cp /sbin/Superuser.apk /system/app/Superuser.apk
#fi

# fix busybox DNS while system is read-write

if [ ! -f "/system/etc/resolv.conf" ]; then
        echo "nameserver 8.8.8.8" >> /system/etc/resolv.conf
        echo "nameserver 8.8.4.4" >> /system/etc/resolv.conf
fi
sync

# remount read only and continue
busybox mount -o remount,ro /
busybox mount -o remount,ro /system


