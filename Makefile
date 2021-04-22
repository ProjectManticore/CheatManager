TARGET = iphone:clang:latest:14.3
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = CheatManager

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = CheatManager

CheatManager_FRAMEWORKS = CoreGraphics SwiftUI
CheatManager_FILES = $(wildcard *.swift */*.swift */*/*.swift */*/*/*.swift)

include $(THEOS_MAKE_PATH)/application.mk
