
DRUPAL_LANG_JA ?= yes

DRUPAL_USER    ?= admin
DRUPAL_PASS    ?= admin
DRUSH          ?= docker-compose run --rm drush drush
DRUPAL_INIT    ?= docker-compose run --rm drupal /bin/bash /usr/local/bin/docker-cmd.sh
DRUPAL_SED     ?= docker-compose run --rm drupal /bin/sed -i""

SITE_MAIL      ?= example@example.com
ACCOUNT_MAIL   ?= $(SITE_MAIL)

MYSQL_ROOT_PASSWORD = password
MYSQL_DATABASE      = drupal
MYSQL_USER          = user
MYSQL_PASSWORD      = password

WOVNPHP_HTACCESS   ?= no

.PHONY: all
all: clean install

.PHONY: clean
clean: clean-wovnphp
	-chmod -f -R +rw public
	rm -rf public
	rm -rf data/mysql/*

.PHONY: install
install: install-drupal install-wovnphp

include ../common/common.mk
include ../common/wovnphp.mk

.PHONY: install-drupal
install-drupal:
	mkdir -p public
	$(DRUPAL_INIT)
	sleep 10 # Wait for database
# TODO: Need mail setting of php
	$(DRUSH) site-install standard -y --account-name=$(DRUPAL_USER) --account-pass=$(DRUPAL_PASS) --site-mail="$(SITE_MAIL)" --account-mail="$(ACCOUNT_MAIL)" \
		--db-su=root --db-su-pw=$(MYSQL_ROOT_PASSWORD) --db-url="mysql://$(MYSQL_USER):$(MYSQL_PASSWORD)@mysql/$(MYSQL_DATABASE)" install_configure_form.update_status_module='array(FALSE,FALSE)'
ifeq ($(DRUPAL_LANG_JA),yes)
	$(DRUSH) dl drush_language --destination=/root/.drush
	$(DRUSH) cache-clear drush
	$(DRUSH) -y pm-enable locale
	$(DRUSH) language-add ja
	$(DRUSH) language-default ja
	$(DRUSH) -y pm-disable locale
	$(DRUSH) -y pm-enable l10n_update
	$(DRUSH) l10n-update-refresh
	$(DRUSH) l10n-update
endif
	$(DRUSH) -y pm-enable pathauto
	$(DRUSH) -y pm-enable ctools
	$(DRUSH) -y pm-enable webform
	$(DRUPAL_SED) -e "0,/<?php/ s/<?php/<?php\nrequire_once \$$_SERVER['DOCUMENT_ROOT'].\'\/WOVN.php\/src\/wovn_interceptor.php\'\);\n/" index.php
