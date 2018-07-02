#!/bin/sh
export KBUILD_BUILD_USER="localgen"
export KBUILD_BUILD_HOST="macbook"
rm -rf py2env
mkdir py2env && virtualenv2 py2env
source py2env/bin/activate
##WILL BE USING CLANG COMPILER ONWARDS
export CROSS_COMPILE=/home/panchajanya/Kernel/Toolchains/my-toolchain/bin/aarch64-linux-android-
export ARCH=arm64
export SUBARCH=arm64
##TO CLEAN SOURCES 
make clean && make mrproper && rm -rf out 
make O=out ARCH=arm64 X00TD_defconfig
#rm -rf ../anykernel/modules/wlan.ko
rm -rf anykernel/Image.gz-dtb
ccache -M 300G
BUILD_START=$(date +"%s")
KERNEL_DIR=$PWD
blue='\033[0;34m' cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
echo "Starting"
echo "Making"
CLANG_TCHAIN=/home/panchajanya/Kernel/Toolchains/clang-7.0.0/llvm-build/Release+Asserts/bin/clang
export KBUILD_COMPILER_STRING="$(${CLANG_TCHAIN} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')"
make -j8 O=out \
                      ARCH=arm64 \
                      CC=/home/panchajanya/Kernel/Toolchains/clang-7.0.0/llvm-build/Release+Asserts/bin/clang \
                       
                      CLANG_TRIPLE=aarch64-linux-android- \
                      CROSS_COMPILE=/home/panchajanya/Kernel/Toolchains/my-toolchain/bin/aarch64-linux-android-
rm -rf py2env
echo "Making dt.img"
echo "Done"
export IMAGE=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
if [[ ! -f "${IMAGE}" ]]; then
    echo -e "Build failed :P. Check errors!";
    break;
else
BUILD_END=$(date +"%s");
rm -rf py2env
DIFF=$(($BUILD_END - $BUILD_START));
BUILD_TIME=$(date +"%Y%m%d-%T");
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol";
echo "Movings Files"
cd anykernel
mv $KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb Image.gz-dtb
echo "Making Zip"
zip -r AzurE-Oreo-X00TD-clang-$BUILD_TIME *
cd ../
mv anykernel/AzurE-Oreo-X00TD-clang-$BUILD_TIME.zip /home/panchajanya/Kernel/Zips/Azure-Builds/Oreo-Builds/AzurE-Oreo-X00TD-$BUILD_TIME.zip
telegram-send --file /home/panchajanya/Kernel/Zips/Azure-Builds/Oreo-Builds/AzurE-Oreo-X00TD-$BUILD_TIME.zip 
echo -e "Kernel is named as $yellow AzurE-Oreo-X00TD-$BUILD_TIME.zip $nocol and can be found at $yellow /home/panchajanya/Kernel/Zips/Azure-Builds/Oreo-Builds.$nocol"
fi

