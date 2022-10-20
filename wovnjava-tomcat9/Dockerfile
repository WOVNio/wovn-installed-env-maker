ARG TOMCAT_VERSION
ARG TOMCAT_JDK
#FROM tomcat:${TOMCAT_VERSION:-9}-${TOMCAT_JDK:-jdk11}
FROM tomcat:${TOMCAT_VERSION}-${TOMCAT_JDK}

RUN ln -s \
  ${CATALINA_HOME}/webapps.dist/manager \
  ${CATALINA_HOME}/webapps/ \
  && ln -s \
  ${CATALINA_HOME}/webapps.dist/ROOT \
  ${CATALINA_HOME}/webapps/

