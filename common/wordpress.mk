
WP_SITE_TITLE ?= WOVN Example
WP_PATH       ?= /var/www/html
WP_LOCAL_PATH ?= public
WP_DOMAIN     ?= 127.0.0.1:8080
WP_SITE_URL   ?= http://$(WP_DOMAIN)/
WP_LANG_JA    ?= yes
WP_MULTISITE  ?= no

WP_ADMIN_USER ?= admin
WP_ADMIN_PASS ?= admin
WP_ADMIN_MAIL ?= wordpress@example.com

WP_INSTALL_WOVNIO_PLUGIN  ?= yes

WP_INSTALL_POPULAR_PLUGIN ?= yes
WP_POPULAR_PLUGIN_LIST    ?= all-in-one-seo-pack \
	google-sitemap-generator \
	broken-link-checker \
	pushpress \
	wordpress-ping-optimizer \
	akismet \
	addquicktag \
	wp-multibyte-patch

WP_SERVICE ?= wordpress
WP_SED     ?= docker-compose run --rm -w $(WP_PATH) $(WP_SERVICE) /bin/sed -i""

ifeq ($(TRAVIS),true)
WP_CLI     ?= docker-compose run --user 0 --rm -w $(WP_PATH) wp_cli wp
else
WP_CLI     ?= docker-compose run --rm -w $(WP_PATH) wp_cli wp
endif

.PHONY: clean-wordpress
clean-wordpress:
	docker-compose down -v
	rm -rf $(WP_LOCAL_PATH)
	rm -rf data/mysql/*

$(WP_LOCAL_PATH)/index.php:
	mkdir -p $(WP_LOCAL_PATH)
	@echo Initialize for WordPress copying to $(WP_LOCAL_PATH)
	docker-compose run --rm -w $(WP_PATH) $(WP_SERVICE) apache2 -v

.PHONY: install-wordpress-core
install-wordpress-core: $(WP_LOCAL_PATH)/index.php
ifeq ($(WP_MULTISITE),yes)
	$(WP_CLI) core multisite-install --path=$(WP_PATH) --url="$(WP_SITE_URL)" --title="$(WP_SITE_TITLE)" \
		--admin_user=$(WP_ADMIN_USER) --admin_password=$(WP_ADMIN_PASS) --admin_email=$(WP_ADMIN_MAIL)
	$(WP_SED) -e "s/define( 'DOMAIN_CURRENT_SITE', '127.0.0.1:8080' );/# define( 'DOMAIN_CURRENT_SITE', '127.0.0.1:8080' );/" wp-config.php
else
	$(WP_CLI) core install --path=$(WP_PATH) --url="$(WP_SITE_URL)" --title="$(WP_SITE_TITLE)" \
		--admin_user=$(WP_ADMIN_USER) --admin_password=$(WP_ADMIN_PASS) --admin_email=$(WP_ADMIN_MAIL)
endif
ifeq ($(WP_LANG_JA),yes)
	$(WP_CLI) core language install ja --activate
endif

.PHONY: install-wordpress-popular-plugins
install-wordpress-popular-plugins:
ifeq ($(WP_INSTALL_POPULAR_PLUGIN),yes)
	$(WP_CLI) plugin install $(WP_POPULAR_PLUGIN_LIST)
endif

.PHONY: install-wovnio-plugin
install-wovnio-plugin:
ifeq ($(WP_INSTALL_WOVNIO_PLUGIN),yes)
	$(WP_CLI) plugin install wovn-io --activate
endif

.PHONY: install-wordpress
install-wordpress: install-wordpress-core install-wordpress-popular-plugins install-wovnio-plugin
	@echo Configuring wp-config.php for ngrok
	$(WP_SED) -e "/wp-settings.php/i ## Automatic configuration addition from Makefile\ndefine('WP_SITEURL', 'http://' . \$$_SERVER['HTTP_HOST']);" wp-config.php
	$(WP_SED) -e "/wp-settings.php/i ## Automatic configuration addition from Makefile\ndefine('WP_HOME', 'http://' . \$$_SERVER['HTTP_HOST']);" wp-config.php
