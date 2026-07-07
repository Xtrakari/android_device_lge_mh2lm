#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device
$(call inherit-product, device/lge/mh2lm/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_mh2lm
PRODUCT_DEVICE := mh2lm
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LGE
PRODUCT_MODEL := G8X ThinQ

PRODUCT_GMS_CLIENTID_BASE := android-lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=mh2lm \
    BuildDesc="mh2lm-user 12 SKQ1.211103.001 223331636afae release-keys" \
    BuildFingerprint=lge/mh2lm/mh2lm:12/SKQ1.211103.001/223331636afae:user/release-keys \
    RisingChipset="Snapdragon 855" \
    RisingMaintainer="Xtrakari"

#Rising Bringup

#Battery Capacity
RISING_BATTERY := "4000 mAh"

#RISING_PACKAGE_TYPE := "VANILLA_AOSP"

# disable/enable blur support, default is false
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_DISABLE_EPPE := true
TARGET_ENABLE_BLUR := true

# whether to ship aperture camera, default is false
PRODUCT_NO_CAMERA := false

# Wether to ship lawnchair launcher
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true

#UDFPS
TARGET_HAS_UDFPS := true

#GMS Flags
WITH_GMS := false
# ships core GMS components that are needed to run GMS environment
#TARGET_CORE_GMS := false
#Extra add-ons for GMS build, check RisingOS manifest for the list
#TARGET_CORE_GMS_EXTRAS := false
# Wether to ship pixel launcher and set it as default launcher
#TARGET_DEFAULT_PIXEL_LAUNCHER := true
