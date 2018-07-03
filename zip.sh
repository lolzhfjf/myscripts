#!/bin/sh
cd AnyKernel2
mv /home/runner/Azure-ASUS/out/arch/arm64/boot/Image.gz-dtb Image.gz-dtb
BUILD_TIME=$(date +"%Y%m%d-%T")
zip -r AzurE-Oreo-X00TD-$BUILD_TIME *
curl ftp-pasv -T AzurE-Oreo-X00TD-$BUILD_TIME.zip ftp://AzurE:GiC5Ht0Ge0ez@uploads.androidfilehost.com
#curl -F chat_id="-1232545787" -F document=AzurE-Oreo-X00TD-$BUILD_TIME.zip https://api.telegram.org/bot508917321:AAFcSMMFzWdr-2wBsmKFhypu2eS7MC0THx0/sendDocument
