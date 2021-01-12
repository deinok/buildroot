################################################################################
#
# dotnet-sdk
#
################################################################################

HOST_DOTNET_SDK_VERSION = 5.0.101
HOST_DOTNET_SDK_SITE = https://dotnetcli.azureedge.net/dotnet/Sdk/$(HOST_DOTNET_SDK_VERSION)
HOST_DOTNET_SDK_SOURCE = dotnet-sdk-$(HOST_DOTNET_SDK_VERSION)-$(call qstrip,$(BR2_PACKAGE_HOST_DOTNET_RID)).tar.gz
HOST_DOTNET_SDK_LICENSE = MIT
HOST_DOTNET_SDK_LICENSE_FILES = LICENSE.txt ThirdPartyNotices.txt

define HOST_DOTNET_SDK_INSTALL_CMDS
	mkdir -p $(HOST_DIR)/usr/share/dotnet/
	cp -dpfr $(@D)/* $(HOST_DIR)/usr/share/dotnet/
	mkdir -p $(HOST_DIR)/usr/bin/
	ln -s ../share/dotnet/dotnet $(HOST_DIR)/usr/bin/dotnet
endef

$(eval $(host-generic-package))
