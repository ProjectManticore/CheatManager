TARGET = iphone:clang:latest:14.3
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = CheatManager

include $(THEOS)/makefiles/common.mk
SUBPROJECTS += CheatKit
include $(THEOS)/makefiles/aggregate.mk

APPLICATION_NAME = CheatManager
CheatManagerSource = CheatManager

CheatManager_EXTRA_FRAMEWORKS = CheatKit
CheatManager_FRAMEWORKS = SwiftUI
CheatManager_FILES = $(wildcard $(CheatManagerSource)/*.swift $(CheatManagerSource)/*/*.swift $(CheatManagerSource)/*/*/*.swift)

include $(THEOS_MAKE_PATH)/application.mk

after-clean::
	if [ -d "packages" ]; then rm -rf packages; fi

after-all::
	@echo "Copying CheatKit..."
	cp -R CheatKit/.theos/obj/debug/CheatKit.framework CHeatManager/Frameworks
