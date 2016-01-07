#!/bin/bash

#get changes from  GitHub 
#echo 'Get changes from GitHub'
#git pull
echo 'Start building...'

# Set options
export ARCH=arm CROSS_COMPILE=../toolchain/linaro-4.9/bin/arm-linux-androideabi-
export KBUILD_BUILD_USER=assusdan
export KBUILD_BUILD_HOST=SkyDroidTeam

#For checking errors
echo 'Remove kernel...'
rm -rf arch/arm/boot/zImage


#echo 'Configure CS'
#make zerasrs_cs_defconfig >/dev/null
#echo 'Build CS'
#make -j4 zImage >/dev/null 2>build.log

#check errors
#if [ ! -f arch/arm/boot/zImage ]
#then
#    echo "BUID ERRORS!"
#fi

#if OK
#echo 'Moving CS'
#mv arch/arm/boot/zImage /var/www/html/zImage_CS 

echo 'Configure DJN'
make alps_defconfig 
echo 'Build DJN'
make -j4 zImage >/dev/null 2>build.log

#check errors in DJN driver 
if [ ! -f arch/arm/boot/zImage ]
then
    echo "DJN PART ERROR"
fi

echo 'Moving DJN'
cp arch/arm/boot/zImage /var/www/html/CM13_zImage_DJN 


#write worktime
echo $[$SECONDS / 60]
echo 'minutes'
echo $[$SECONDS % 60]
echo 'seconds' 

#echo 'Configure A'
#make zerasra_defconfig >/dev/null
#echo 'Build A'
#make -j4 zImage >/dev/null 2>buildlog.log
#echo 'Moving A'
#mv arch/arm/boot/zImage /var/www/html/zImage_A 
