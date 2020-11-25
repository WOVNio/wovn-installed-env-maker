
MT_VERSION ?= 7.4.0

WOVNPHP_WOVN_INDEX  := yes
WOVNPHP_HTACCESS    := yes

MT_INIT_SQL=$(shell ls data/mt.$(MT_VERSION).sql 2>/dev/null)
MT_CONFIG=$(shell ls mt-config.$(MT_VERSION).cgi 2>/dev/null)


.PHONY: all
all: clean install

.PHONY: clean
clean: clean-wovnphp
	docker-compose down -v
	rm -rf public/* cgi-bin/*
	rm -rf data/mysql/* data/docker-entrypoint-initdb.d/*

.PHONY: install
install: install-wovnphp
ifeq (${MT_INIT_SQL}, data/mt.$(MT_VERSION).sql)
	cp data/mt.$(MT_VERSION).sql data/docker-entrypoint-initdb.d/
endif
	docker-compose run --rm mt apache2 -v
	chmod -R a+w cgi-bin/mt/mt-static
	mkdir -p public/mt
ifeq (${MT_CONFIG}, mt-config.$(MT_VERSION).cgi)
	cp mt-config.$(MT_VERSION).cgi cgi-bin/mt/mt-config.cgi
endif


include ../common/common.mk
include ../common/wovnphp.mk
