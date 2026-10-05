FROM tomcat:10.1-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Download MySQL Connector/J
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/9.7.0/mysql-connector-j-9.7.0.jar /usr/local/tomcat/lib/

# Copy project files
COPY *.jsp /usr/local/tomcat/webapps/ROOT/
COPY *.html /usr/local/tomcat/webapps/ROOT/
COPY *.png /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
