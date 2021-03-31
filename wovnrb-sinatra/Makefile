
BUNDLE=docker-compose run --rm ruby bundle

.PHONY: all
all: clean install

.PHONY: clean
clean:
	docker-compose down -v
	rm -rf app/vendor
	rm -f app/Gemfile.lock

.PHONY: install
install:
	docker-compose build --no-cache


include ../common/common.mk
