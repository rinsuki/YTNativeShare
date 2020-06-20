INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTNativeShare

YTNativeShare_FILES = Tweak.x
YTNativeShare_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
