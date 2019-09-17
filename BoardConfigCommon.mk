#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/motorola/msm8226-common/BoardConfigVendor.mk

VENDOR_PATH := device/motorola/msm8226-common

BOARD_VENDOR := motorola-qcom

TARGET_SPECIFIC_HEADER_PATH := $(VENDOR_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_DTBTOOL_ARGS := --force-v2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.bootdevice=msm_sdcc.1 androidboot.hardware=qcom vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags loop.max_part=7 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_ROOT_EXTRA_FOLDERS := firmware fsg pds persist
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_SOURCE := kernel/motorola/msm8226

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(VENDOR_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_BTNV := true

# Broken Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true

# Display
TARGET_USES_C2D_COMPOSITION := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
TARGET_USES_ION := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Filesystem
TARGET_ALLOW_LEGACY_AIDS := true
TARGET_FS_CONFIG_GEN := $(VENDOR_PATH)/config.fs
TARGET_USES_MKE2FS := true

# Fonts
EXCLUDE_SERIF_FONTS := true
SMALLER_FONT_FOOTPRINT := true

# HIDL
DEVICE_MANIFEST_FILE := $(VENDOR_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(VENDOR_PATH)/compatibility_matrix.xml

# Keymaster
TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Lineage Hardware
JAVA_SOURCE_OVERLAYS := org.lineageos.hardware|$(VENDOR_PATH)/lineagehw|**/*.java

# Memory
MALLOC_SVELTE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
TARGET_SYSTEM_PROP += $(VENDOR_PATH)/system.prop

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
BOARD_NO_SECURE_DISCARD := true
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Release tools
TARGET_RELEASETOOLS_EXTENSIONS := $(VENDOR_PATH)

# Render
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true

# Dexpreopt
WITH_DEXPREOPT_DEBUG_INFO := false
USE_DEX2OAT_DEBUG := false
DONT_DEXPREOPT_PREBUILTS := true

# SELinux
#include device/qcom/sepolicy-legacy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(VENDOR_PATH)/sepolicy/private

BOARD_SEPOLICY_DIRS += \
	$(VENDOR_PATH)/sepolicy-tmp

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/bin/thermal-engine|libshims_thermal.so \
    /system/vendor/bin/mpdecision|libshims_atomic.so \
    /system/lib/hw/camera.vendor.msm8226.so|libshims_camera.so \
    /system/lib/libmot_sensorlistener.so|libshims_sensorlistener.so \
    /system/vendor/lib/libqc-opt.so|libshim_qcopt.so \
    /system/lib/libmdmcutback.so|libqsap_shim.so \
    /system/lib/libskia.so|libshim_skia.so \
    /system/vendor/lib/libperipheral_client.so|libshim_binder.so

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
PRODUCT_VENDOR_MOVE_ENABLED := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
