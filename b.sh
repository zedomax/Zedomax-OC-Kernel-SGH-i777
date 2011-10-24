make -j8 ARCH=arm CROSS_COMPILE=/stuff/arm-2009q3/bin/arm-none-eabi- 

cp drivers/net/wireless/bcm4330/dhd.ko initramfs/lib/modules/.
cp drivers/samsung/vibetonz/vibrator.ko initramfs/lib/modules/.
cp drivers/samsung/j4fs/j4fs.ko initramfs/lib/modules/.
cp drivers/bluetooth/bthid/bthid.ko initramfs/lib/modules/.
cp drivers/scsi/scsi_wait_scan.ko initramfs/lib/modules/.
cp drivers/media/video/gspca/gspca_main.ko initramfs/lib/modules/.
#cp drivers/staging/westbridge/astoria/switch/cyasswitch.ko initramfs/lib/modules/.

cd arch/arm/boot
tar cvf Z5.tar zImage
cp Z5.tar /here/.
cp zImage /here/.
