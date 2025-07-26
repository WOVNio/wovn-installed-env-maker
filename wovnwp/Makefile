WP_INSTALL_WOVNIO_PLUGIN  := yes
WP_INSTALL_POPULAR_PLUGIN := no
# WP_WOVNIO_PLUGIN_VERSION  := 1.12.2
WP_SERVICE = apache

.PHONY: all
all: clean install

.PHONY: clean
clean: clean-wordpress

.PHONY: install
install: install-wordpress
#	$(WP_SED) "4a # RewriteRule ^/?(?:ar|eu|bn|bg|ca|zh-CHS|zh-CHT|da|nl|en|fi|fr|gl|de|el|he|hu|id|it|ja|ko|lv|ms|my|ne|no|fa|pl|pt|ru|es|sw|sv|tl|th|hi|tr|uk|vi)($$|/.*$$) $$\1 [L]" .htaccess
#	$(WP_CLI) plugin install contact-form-7
#	$(WP_CLI) plugin install mw-wp-form


include ../common/common.mk
include ../common/wordpress.mk
