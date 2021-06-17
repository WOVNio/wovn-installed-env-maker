
.PHONY: all
all: clean build

.PHONY: clean
clean: clean-wovnjava

.PHONY: build
build:
	docker-compose run --rm gradle gradle build

.PHONY: deploy
deploy:
	cp -f build/libs/ROOT.war tomcat-webapps/


include ../common/common.mk
