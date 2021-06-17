
.PHONY: all
all: clean build deploy

.PHONY: clean
clean:
	docker-compose run --rm gradle gradle clean
	rm -f tomcat-webapps/ROOT.war

.PHONY: build
build:
	docker-compose run --rm gradle gradle build

.PHONY: deploy
deploy:
	cp -f build/libs/ROOT.war tomcat-webapps/


include ../common/common.mk
