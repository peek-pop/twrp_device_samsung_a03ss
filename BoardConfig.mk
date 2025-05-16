#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Device path
DEVICE_PATH := device/samsung/a03s

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := a03s,a03snnxx
AB_OTA_UPDATER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true
TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
TARGET_USES_UEFI := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := a03s
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
BOARD_VENDOR := Samsung
TARGET_SOC := MT6765V/WB
TARGET_SOC_NAME := Mediatek
TARGET_BOARD_PLATFORM := MT6765
TARGET_BOARD_PLATFORM_GPU := := PowerVR Rogue GE8320
BOARD_USES_MTK_HARDWARE := true
TARGET_HARDWARE_3D := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 13107
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 38797312
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_ODMIMAGE_PARTITION_SIZE := 4349952
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 131787512
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3703758848
BOARD_VENDORIMAGE_PARTITION_SIZE := 768073728

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 6106906624
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 6106906624
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1
BOARD_KERNEL_CMDLINE += androidboot.boot_device=bootdevice
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_DTB_OFFSET := 0x07808000

BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_NO_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := $(DEVICE_PATH)/avb/system_prvk.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := $(DEVICE_PATH)/avb/vendor_prvk.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 4

BOARD_AVB_RECOVERY_KEY_PATH := $(DEVICE_PATH)/avb/recovery_prvk.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
# AVB - Android Verified Boot / dm-verity
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := $(DEVICE_PATH)/avb/oem_prvk.pem
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

BOARD_AVB_VBMETA_ALGORITHM := SHA256_RSA2048
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

BOARD_AVB_BOOT_KEY_PATH := $(DEVICE_PATH)/avb/boot_prvk.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 3

#A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
# fscrypt policy FBEv2
TW_USE_FSCRYPT_POLICY := 2

TW_PREPARE_DATA_MEDIA_EARLY := true

# Hack to get keymaster to recognize the key files & prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Stock info
#VENDOR_SECURITY_PATCH := 2022-02-05
#PLATFORM_VERSION := 12

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6768.rc

# TWRP specific build flags
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := false
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_DEVICE_VERSION := Galaxy A03s
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 130
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
# Attempt to reducing size img file compiled
# Exclude mode specific build flags
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_LPTOOLS := true
TW_EXCLUDE_LPDUMP := true
#TW_EXCLUDE_MTP := true

BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
TW_USE_LEGACY_BATTERY_SERVICES := true

# Storage
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true

# resetprop and magiskboot
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true

# Resolution
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600

# Statusbar icons flags 720 x 1600
TW_STATUS_ICONS_ALIGN := center
#TW_CUSTOM_CPU_POS := 50
TW_CUSTOM_CLOCK_POS := 300
#TW_CUSTOM_BATTERY_POS := 800

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#TW_CRYPTO_FS_TYPE := "f2fs"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/bootdevice/by-name/userdata"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,reserve_root=55451,resuid=0,resgid=1065,inlinecrypt,alloc_mode=default,fsync_mode=posix 0 0"
#TW_CRYPTO_FS_OPTIONS := "rw,seclabel,nosuid,nodev,noatime,noauto_da_alloc,inlinecrypt,resgid=1065,errors=panic,data=ordered"
#/dev/block/dm-7 /data f2fs rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,reserve_root=55451,resuid=0,resgid=1065,inlinecrypt,alloc_mode=default,fsync_mode=posix 0 0
#/dev/block/dm-7 /data/user/0 f2fs rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,reserve_root=55451,resuid=0,resgid=1065,inlinecrypt,alloc_mode=default,fsync_mode=posix 0 0
#TW_CRYPTO_KEY_LOC := /metadata/vold/metadata_encryption/key
