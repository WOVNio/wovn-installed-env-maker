
# You can use something like "feature/name", ex.) make WOVNPHP_BRANCH_NAME=feature/name
WOVNPHP_BRANCH_NAME  ?= master
WOVNPHP_INSTALL_DIR  ?= public
WOVNPHP_HTACCESS     ?= yes
WOVNPHP_DOWNLOAD_URL  = https://github.com/WOVNio/WOVN.php/archive/$(WOVNPHP_BRANCH_NAME).zip

DIR_SUFFIX = $(subst /,-,$(WOVNPHP_BRANCH_NAME))


.PHONY: wovnphp
wovnphp: clean-wovnphp install-wovnphp

.PHONY: clean-wovnphp
clean-wovnphp:
	rm -rf $(WOVNPHP_INSTALL_DIR)/WOVN.php
	rm -f $(WOVNPHP_INSTALL_DIR)/wovn.ini $(WOVNPHP_INSTALL_DIR)/wovn_index.php
ifeq ($(WOVNPHP_HTACCESS),yes)
	rm -f $(WOVNPHP_INSTALL_DIR)/.htaccess
endif

WOVN.php.zip:
	curl -f -Ls $(WOVNPHP_DOWNLOAD_URL) -o WOVN.php.zip

.INTERMEDIATE: WOVN.php.zip

$(WOVNPHP_INSTALL_DIR)/WOVN.php-$(DIR_SUFFIX): WOVN.php.zip
	unzip -q -o WOVN.php.zip

$(WOVNPHP_INSTALL_DIR)/WOVN.php: $(WOVNPHP_INSTALL_DIR)/WOVN.php-$(DIR_SUFFIX)
	mkdir -p $(WOVNPHP_INSTALL_DIR)
	mv WOVN.php-$(DIR_SUFFIX) $(WOVNPHP_INSTALL_DIR)/WOVN.php

$(WOVNPHP_INSTALL_DIR)/wovn.ini: $(WOVNPHP_INSTALL_DIR)/WOVN.php
	cp -f $(WOVNPHP_INSTALL_DIR)/WOVN.php/wovn.ini.sample $(WOVNPHP_INSTALL_DIR)/wovn.ini


.PHONY: install-wovnphp
install-wovnphp: $(WOVNPHP_INSTALL_DIR)/WOVN.php
	cp -f $(WOVNPHP_INSTALL_DIR)/WOVN.php/wovn.ini.sample $(WOVNPHP_INSTALL_DIR)/wovn.ini
	cp -f $(WOVNPHP_INSTALL_DIR)/WOVN.php/wovn_index_sample.php $(WOVNPHP_INSTALL_DIR)/wovn_index.php
ifeq ($(WOVNPHP_HTACCESS),yes)
	cp -f $(WOVNPHP_INSTALL_DIR)/WOVN.php/htaccess_sample $(WOVNPHP_INSTALL_DIR)/.htaccess
endif
