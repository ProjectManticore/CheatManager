TARGET = iphone:clang:latest:14.3
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = CheatManager

include $(THEOS)/makefiles/common.mk
SUBPROJECTS += CheatKit
include $(THEOS_MAKE_PATH)/aggregate.mk

APPLICATION_NAME = CheatManager
CheatManagerSource = CheatManager

CheatManager_FRAMEWORKS = SwiftUI CheatKit
CheatManager_FILES = $(wildcard $(CheatManagerSource)/*.swift $(CheatManagerSource)/*/*.swift $(CheatManagerSource)/*/*/*.swift)

include $(THEOS_MAKE_PATH)/application.mk

