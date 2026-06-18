#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/lge/mh2lm/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Call the BCR setup
$(call inherit-product-if-exists, vendor/bcr/bcr.mk)

#For official Devices:
MATRIXX_BUILD_TYPE := Unofficial
MATRIXX_MAINTAINER := Xtrakari
MATRIXX_CHIPSET := SM8150
MATRIXX_BATTERY := 4000mAh
MATRIXX_DISPLAY := 1080x2340

#EPPE
TARGET_DISABLE_EPPE := true

#BOOT_ANIMATION
TARGET_BOOT_ANIMATION_RES := 1080

#AUDIOFX
TARGET_EXCLUDES_AUDIOFX := true

#Build with Gapps:
WITH_GMS := false

#Device has UDFPS:
TARGET_HAS_UDFPS := true

#Blur effect
TARGET_ENABLE_BLUR := true

#Add Google Contacts, Dialer & Messaging 
BUILD_GOOGLE_CONTACTS := true
BUILD_GOOGLE_DIALER := true
BUILD_GOOGLE_MESSAGE := true

#Device has UDFPS:
TARGET_HAS_UDFPS := true

#Blur effect
TARGET_ENABLE_BLUR := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_mh2lm
PRODUCT_DEVICE := mh2lm
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LGE
PRODUCT_MODEL := G8X ThinQ
TARGET_VENDOR_PRODUCT_NAME := mh2lm
TARGET_VENDOR_DEVICE_NAME := mh2lm

PRODUCT_GMS_CLIENTID_BASE := android-lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=mh2lm \
    PRIVATE_BUILD_DESC="mh2lm-user 12 SKQ1.211103.001 223331636afae release-keys"

BUILD_FINGERPRINT := lge/mh2lm/mh2lm:12/SKQ1.211103.001/223331636afae:user/release-keys
