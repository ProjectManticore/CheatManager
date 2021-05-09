TARGET = iphone:clang:latest:14.3
ARCHS = arm64
INSTALL_TARGET_PROCESSES = CheatManager

include $(THEOS)/makefiles/common.mk

XCODEPROJ_NAME = CheatManager

CheatManager_XCODE_SCHEME = CheatManagerBundle
CheatManager_CODESIGN_FLAGS =

include $(THEOS_MAKE_PATH)/xcodeproj.mk
