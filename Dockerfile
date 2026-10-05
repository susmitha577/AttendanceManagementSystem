FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY *.jsp /usr/local/tomcat/webapps/ROOT/
COPY *.html /usr/local/tomcat/webapps/ROOT/
COPY *.png /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
