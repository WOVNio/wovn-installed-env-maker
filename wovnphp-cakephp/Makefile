
APPNAME  := app
COMPOSER := docker-compose run --rm composer
SED      := docker-compose run --rm apache /bin/sed -i""

WOVNPHP_INSTALL_DIR = $(APPNAME)/webroot
WOVNPHP_HTACCESS    = no

.PHONY: all
all: clean install

.PHONY: clean
clean: clean-wovnphp
	rm -rf $(APPNAME)

include ../common/common.mk
include ../common/wovnphp.mk

$(APPNAME)/index.php:
	$(COMPOSER) --ignore-platform-reqs create-project --no-interaction --prefer-dist 'cakephp/app:4.*' $(APPNAME)
	chmod -R 777 $(WOVNPHP_INSTALL_DIR)

.PHONY: cakephp
cakephp: $(APPNAME)/index.php

.PHONY: install
install: cakephp install-wovnphp
	$(SED) -e "0,/<?php/ s/<?php/<?php\n\nrequire_once\(__DIR__.\'\/WOVN.php\/src\/wovn_interceptor.php\'\);\n/" index.php
	$(SED) "2a \    RewriteRule ^/?(?:ar|eu|bn|bg|ca|zh-CHS|zh-CHT|da|nl|en|fi|fr|gl|de|el|he|hu|id|it|ja|ko|lv|ms|my|ne|no|fa|pl|pt|ru|es|sw|sv|tl|th|hi|tr|uk|vi)($$|/.*$$) $$\1 [L]" .htaccess
