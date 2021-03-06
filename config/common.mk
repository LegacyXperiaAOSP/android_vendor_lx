PRODUCT_VERSION_MAJOR = 6
PRODUCT_VERSION_MINOR = 0

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter NIGHTLY SNAPSHOT,$(LX_BUILDTYPE)),)
    LX_BUILDTYPE := UNOFFICIAL
endif

LX_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(LX_BUILDTYPE)-$(LX_BUILD)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.lx.version=$(LX_VERSION) \
  ro.modversion=$(LX_VERSION)

PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_BOOTANIMATION := vendor/lx/prebuilt/bootanimation/$(TARGET_SCREEN_WIDTH).zip
