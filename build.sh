#!/bin/bash

CROSS_COMPILER=/kernel/arm-2009q3/bin/arm-none-eabi-
CPU_NUMBER=8


echo "###################################################"
echo " MSM7201A Android Kernel build"
echo " Galaxy only version"
echo " ------------------------------------------- "


#source setup.sh


echo "Config File : capela_defconfig"
make ARCH=arm CROSS_COMPILE=$CROSS_COMPILER c1_rev02_usa_att_defconfig

echo "Start menuconfig"
make ARCH=arm CROSS_COMPILE=$CROSS_COMPILER menuconfig

echo "build all"
if [ "$CPU_NUMBER" = "" ] ; then
	echo "make -j1 ARCH=arm CROSS_COMPILE=$CROSS_COMPILER 2>&1 | tee build_kernel.log"
		make -j1 ARCH=arm CROSS_COMPILE=$CROSS_COMPILER 2>&1 | tee build_kernel.log
else
	echo "make -j$CPU_NUMBER ARCH=arm CROSS_COMPILE=$CROSS_COMPILER 2>&1 | tee build_kernel.log"
	make -j$CPU_NUMBER ARCH=arm CROSS_COMPILE=$CROSS_COMPILER 2>&1 | tee build_kernel.log
fi

cd ..

