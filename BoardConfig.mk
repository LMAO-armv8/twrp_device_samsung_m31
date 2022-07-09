#
# Copyright (C) 2021 The Android Open Source Project
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
#

COMMON_PATH := device/samsung/m31
PRODUCT_OUT := out/target/product/m31

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := exynos9611
TARGET_BOOTLOADER_BOARD_NAME := exynos9611
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Build vars
TARGET_SUPPORTS_64_BIT_APPS := true
ALLOW_MISSING_DEPENDENCIES := true
TARGET_COPY_OUT_VENDOR := vendor

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := exynos9611
TARGET_BOARD_PLATFORM_GPU := mali-g72
PLATFORM_SECURITY_PATCH := 2021-05-01

# Kernel
TARGET_KERNEL_CONFIG := exynos9610-m31nsxx_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/samsung/m31
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(COMMON_PATH)/kernel/mkbootimg.mk
BOARD_DTBO_CFG := $(DEVICE_PATH)/kernel/dtbo.cfg
#TARGET_PREBUILT_KERNEL := device/samsung/m31/prebuilt/Image
#BOARD_PREBUILT_DTBIMAGE_DIR := device/samsung/m31/prebuilt/dtb
#BOARD_PREBUILT_DTBOIMAGE := device/samsung/m31/prebuilt/recoverydtbo
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPERATE_DTBO := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=universal9611
BOARD_MKBOOTIMG_ARGS := --dtb_offset 0x00000000
BOARD_MKBOOTIMG_ARGS += --kernel_offset 0x00008000
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x01000000
BOARD_MKBOOTIMG_ARGS += --tags_offset 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version 2
BOARD_MKBOOTIMG_ARGS += --board SRPSL10A002KU
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
#BOARD_MKBOOTIMG_ARGS += --kernel $(recovery_kernel)
BOARD_MKBOOTIMG_ARGS += --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img
BOARD_MKBOOTIMG_ARGS += --cmdline $(BOARD_KERNEL_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --kernel $(PRODUCT_OUT)/kernel

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_FLASH_BLOCK_SIZE := 131072

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 61865984
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 71102464
BOARD_DTBOIMG_PARTITION_SIZE       := 8388608
BOARD_SUPER_PARTITION_SIZE := 6365921848
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
    product \
    odm

# BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE is set to BOARD_SUPER_PARTITION_SIZE / 2 - 4MB
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 3178766620

# Set error limit to BOARD_SUPER_PARTITION_SIZE - 500MB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 5841633848

ifneq ($(WITH_GMS),true)
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200
endif

# Ramdisk
BOARD_ROOT_EXTRA_FOLDERS := \
    prism \
    optics \
    metadata \
    efs \
    carrier \
    dqmdbg \
    spu \
    keydata \
    keyrefuge

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_SYSTEM_PROP := $(COMMON_PATH)/system.prop
AB_OTA_UPDATER := false

# ANDROID VERIFIED BOOT
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 0

PLATFORM_VERSION := 12

# Keymaster Support
TARGET_KEYMASTER_VARIANT := samsung

# MetaData
BOARD_USES_METADATA_PARTITION := true

# Haptics
TW_USE_SAMSUNG_HAPTICS := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 365
TW_DEFAULT_BRIGHTNESS := 200
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_RESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/root/system/etc/recovery.fstab
TW_EXCLUDE_LPDUMP := true
