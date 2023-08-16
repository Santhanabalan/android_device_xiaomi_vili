echo "Starting to clone stuffs needed for the current device"
echo "cloning Common Tree[1/8]"

# SM8350 Common Tree
rm -rf device/xiaomi/sm8350-common
git clone --depth=1 https://github.com/Santhanabalan/android_device_xiaomi_sm8350-common -b pe+ device/xiaomi/sm8350-common

echo "Cloning Vili Vendor Tree [2/8]"

# Device Vendor Tree"
rm -rf vendor/xiaomi
git clone --depth=1 https://github.com/Santhanabalan/android_vendor_xiaomi_vili vendor/xiaomi/vili

echo "Cloning Common Vendor Tree[3/8]"

# Common Vendor Tree
git clone --depth=1 https://github.com/Santhanabalan/android_vendor_xiaomi_sm8350-common vendor/xiaomi/sm8350-common

echo "Cloning Global Firmware [4/8]"

# Firmware Tree
git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-firmware vendor/xiaomi/vili-firmware

echo "Cloning MiuiCamera(LEICA) [5/8]"

# Leica Camera
git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-miuicamera vendor/xiaomi/vili-miuicamera

echo "Cloning Kernel Tree [6/8]"

# Kernel Tree
rm -rf kernel/xiaomi/sm8350
git clone --depth=1 https://github.com/Santhanabalan/android_kernel_xiaomi_sm8350 kernel/xiaomi/sm8350

echo "Adding/Bumping KernelSU support [7/8]"

# KernelSU
cd kernel/xiaomi/sm8350
rm -rf KernelSU
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
cd ../../../

echo "Cloning Xiaomi Hardware [8/8]"

# Hardware Xiaomi
rm -rf hardware/xiaomi
git clone --depth=1 https://github.com/Santhanabalan/android_hardware_xiaomi hardware/xiaomi

echo "Completed, Now Proceeding to Lunch"