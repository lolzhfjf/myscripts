#!/bin/sh
make O=out ARCH=arm64 X00TD_defconfig
ccache -M 300G
BUILD_START=$(date +"%s")

blue='\033[0;34m' cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
echo "Starting"
echo "Making"
export ARCH=arm64 
export CC=$KERNEL_DIR/linux-x86/clan-4053586/bin/clang 
export CLANG_TRIPLE=aarch64-linux-gnu- 
export CROSS_COMPILE=$KERNEL_DIR/aarch64-linux-android-4.9/bin/aarch64-linux-android-

make -j8 O=out 
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
blue='\033[0;34m' cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol";
                      
                                           
                      
                      


