ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang::5.0

TWEAK_NAME = KeyboardAccio
KeyboardAccio_OBJCC_FILES = Tweak.xm
KeyboardAccio_FRAMEWORKS = UIKit
KeyboardAccio_CFLAGS = -F$(SYSROOT)/System/Library/CoreServices -fobjc-arc
SDKVERSION = 10.2
SYSROOT = $(THEOS)/sdks/iPhoneOS10.2.sdk
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

sync: stage
	rsync -e "ssh -p 2222" -z .theos/_/Library/MobileSubstrate/DynamicLibraries/* root@127.0.0.1:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@127.0.0.1 -p 2222 killall MobileNotes
	ssh root@127.0.0.1 -p 2222 open com.apple.mobilenotes