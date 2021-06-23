
WOVNJAVA_VERSION      ?= 1.7.2
WOVNJAVA_DOWNLOAD_URL  = https://jitpack.io/com/github/wovnio/wovnjava/$(WOVNJAVA_VERSION)/wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar
TOMCAT_WEBINF          = WEB-INF
WOVNJAVA_INSTALL_DIR   = $(TOMCAT_WEBINF)/lib


.PHONY: wovnjava
wovnjava: clean-wovnjava install-wovnjava

.PHONY: clean-wovnjava
clean-wovnjava:
	rm -rf $(WOVNJAVA_INSTALL_DIR)/wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar

wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar:
	curl -f -O -Ls $(WOVNJAVA_DOWNLOAD_URL)

.INTERMEDIATE: wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar

.PHONY: install-wovnjava
install-wovnjava: wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar
	mkdir -p $(WOVNJAVA_INSTALL_DIR)
	cp -f wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar $(WOVNJAVA_INSTALL_DIR)/wovnjava-$(WOVNJAVA_VERSION)-jar-with-dependencies.jar
