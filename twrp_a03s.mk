#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
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

# Release name
PRODUCT_RELEASE_NAME := a03s

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit from star device
$(call inherit-product, device/ulefone/a03s/device.mk)

# Inherit some common recovery stuff.
$(call inherit-product, vendor/twrp/config/common.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a03s
PRODUCT_NAME := twrp_a03snnxx
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A037F
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=a03s \
    PRODUCT_NAME=a03s \
    PRIVATE_BUILD_DESC="a03snnxx-user 12 SP1A.210812.016 A037FXXS7CXK1 release-keys"

BUILD_FINGERPRINT := samsung/a03snnxx/a03s:12/SP1A.210812.016/A037FXXS7CXK1:user/release-keys

# Bypass anti-rollback ROMs protection
# Set build date to Fri Nov 15 19:13:13 KST 2024
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.build.date.utc=1731665593
