echo 'Starting to clone stuffs needed to build for Vili'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/Santhanabalan/android_device_xiaomi_sm8350-common -b lineage-21 device/xiaomi/sm8350-common

# Kernel
# Recursively clone KernelSU also
echo 'Cloning kernel tree'
git clone --depth=1 https://github.com/Santhanabalan/android_kernel_xiaomi_sm8350.git --recursive -b lineage-21 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning vendor tree'
git clone https://github.com/Santhanabalan/android_vendor_xiaomi_vili -b udc vendor/xiaomi/vili

# Vendor common
echo 'Cloning common vendor tree'
git clone https://github.com/Santhanabalan/android_vendor_xiaomi_sm8350-common -b udc vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-firmware.git -b 13.0 vendor/xiaomi/vili-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-miuicamera.git -b fourteen-leica vendor/xiaomi/vili-miuicamera

# Remove megvii
rm -rf hardware/xiaomi/megvii

# Leica patch
echo 'Adding Leica camera patch'
cd frameworks/base
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/LeicaCamera/0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/LeicaCamera/0002-Expose-aux-camera-if-packagename-is-null.patch
patch -p1 <0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
patch -p1 <0002-Expose-aux-camera-if-packagename-is-null.patch
cd ../..

# Audio
echo 'Adding audio-app support'
cd system/core
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/Audio-app-main/0001-Add-audio-app-support.patch
patch -p1 <0001-Add-audio-app-support.patch
cd ../..

# VoNR
echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

# Gms
echo 'Adding Gms patch'
cd frameworks/base
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/Gms/0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/Gms/0002-Remove-read-device-config-checks.patch
patch -p1 <0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
patch -p1 <0002-Remove-read-device-config-checks.patch
cd ../..

# Dolby
echo 'Adding Dolby patch'
cd frameworks/av
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/udc-14/Dolby/0001-Add-support-for-loading-prebuilt-ddp-and-ac4-decoder-lib.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/udc-14/Dolby/0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/udc-14/Dolby/0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/udc-14/Dolby/0004-Import-Dolby-Effects-initialization.patch
patch -p1 <0001-Add-support-for-loading-prebuilt-ddp-and-ac4-decoder-lib.patch
patch -p1 <0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
patch -p1 <0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0004-Import-Dolby-Effects-initialization.patch
cd ../..

# Optimization
echo 'Adding optimization patch'
cd frameworks/base
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/Optimization/0001-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Santhanabalan/Patch-Vili/14/Optimization/0002-Remove-USB-charging-notification.patch
patch -p1 <0001-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0002-Remove-USB-charging-notification.patch
cd ../..

echo 'Deleting vendorsetup.sh after Initial Execution'
rm -- "$0"