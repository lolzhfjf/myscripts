#!/bin/sh

KERNEL_DIR=$PWD
git clone --depth 1 --no-single-branch https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9

git clone --depth=1 --no-single-branch https://github.com/Panchajanya1999/AnyKernel2.git

#git clone --depth=1 --no-single-branch https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86
#cd linux-x86 && rm -rf clang-3289846 clang-4639204 clang-4679922 clang-4691093 clang-r328903 clang-stable
#cd ../
#ccache -M 100G
git clone --depth=1 https://github.com/Panchajanya1999/clang-7.0.git
export CROSS_COMPILE=
export ARCH=arm64
export SUBARCH=arm64
make O=out ARCH=arm64 X00TD_defconfig


BUILD_START=$(date +"%s")

blue='\033[0;34m' cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
echo "Starting"
echo "Making"
make -j8 O=out \
                      ARCH=arm64 \
                      CC=/home/runner/Azure-ASUS/clang-7.0/clang-4679922/bin/clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=/home/runner/Azure-ASUS/aarch64-linux-android-4.9/bin/aarch64-linux-android-

BUILD_END=$(date +"%s")
BUILD_TIME=$(date +"%Y%m%d-%T");
DIFF=$(($BUILD_END - $BUILD_START))
blue='\033[0;34m' cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
rm -rf linux-x86
                      
                                           
                      
                      


