#!/bin/sh
cd AnyKernel2
mv /home/runner/Azure-ASUS/out/arch/arm64/boot/Image.gz-dtb Image.gz-dtb
BUILD_TIME=$(date +"%Y%m%d-%T")
zip -r AzurE-Oreo-X00TD-$BUILD_TIME *


#POSTCHANNEL=$(printf 'Build Completed Successfully..!!\nDevice : ASUS X00TD\nBuild Details : $(BUILD_TIME)\n\nInstructions To Flash This Build :- \n 1)Dirty Flashing Your ROM is Necessary...!!!\n 2)Wipe Dalvik & Cache after flashing...!!\n\nNote :- This Build is a Continuous Integration Build, Compiled with CLANG 5...!!!\nEnjoy Flashing\nThank You -@Whiteliners')


#curl -ftp-pasv -T AzurE-Oreo-X00TD-$BUILD_TIME.zip ftp://AzurE:GiC5Ht0Ge0ez@uploads.androidfilehost.com

#curl -s -X POST "https://api.telegram.org/bot508917321:AAFcpu2eS7MC0THx0/sendMessage" -d chat_id="-1001232545787" -d text="Build Completed for ASUS X00TD"

#curl -F chat_id="-1001232545787" -F document=AzurE-Oreo-X00TD-$BUILD_TIME.zip https://api.telegram.org/bot508917321:AAHg8-vR5WeLnXKe_7BHv6FaAYWkKxIHYjY/sendDocument


curl -F chat_id="-1001232545787" -F document=@"AzurE-Oreo-X00TD-$BUILD_TIME.zip" https://api.telegram.org/bot508917321:AAHSX2mi-idya7i7DdTiOsy6as19sJThMxE/sendDocument
