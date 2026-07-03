################################################################################
#
# optocam
#
################################################################################

OPTOCAM_VERSION = 1.0
OPTOCAM_SITE = $(OPTOCAM_PKGDIR)/src
OPTOCAM_SITE_METHOD = local
OPTOCAM_LICENSE = MIT
OPTOCAM_DEPENDENCIES = libcamera jpeg freetype

define OPTOCAM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
		-C $(@D)
endef

define OPTOCAM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/optocam_app $(TARGET_DIR)/usr/bin/optocam_app
	$(INSTALL) -D -m 0755 $(@D)/optocam_preview $(TARGET_DIR)/usr/bin/optocam_preview
endef

$(eval $(generic-package))
