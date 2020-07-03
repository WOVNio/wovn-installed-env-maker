WP_INSTALL_WOVNIO_PLUGIN  := no
WP_INSTALL_POPULAR_PLUGIN := no
WOVNPHP_WOVN_INDEX  := no
WOVNPHP_HTACCESS    = no


.PHONY: all
all: clean install

.PHONY: clean
clean: clean-wovnphp clean-wordpress

.PHONY: install
install: install-wordpress install-wovnphp
	$(WP_SED) -e "0,/<?php/ s/<?php/<?php\n\nrequire_once\(__DIR__.\'\/WOVN.php\/src\/wovn_interceptor.php\'\);\n/" index.php
ifeq ($(WP_MULTISITE),yes)
	@echo Override the .htaccess file with the appropriate multisite rewrite rules.
	cp -f htaccess.multisite.subfolder $(WP_LOCAL_PATH)/.htaccess
endif
#	$(WP_SED) "4a # RewriteRule ^/?(?:ar|eu|bn|bg|ca|zh-CHS|zh-CHT|da|nl|en|fi|fr|gl|de|el|he|hu|id|it|ja|ko|lv|ms|my|ne|no|fa|pl|pt|ru|es|sw|sv|tl|th|hi|tr|uk|vi)($$|/.*$$) $$\1 [L]" .htaccess
#	$(WP_CLI) plugin install contact-form-7
#	$(WP_CLI) plugin install mw-wp-form


include ../common/common.mk
include ../common/wovnphp.mk
include ../common/wordpress.mk
