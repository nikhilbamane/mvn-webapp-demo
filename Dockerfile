FROM tomcat:8-jre8
RUN rm -rf /usr/local/tomcat/webapps/*
# WORKDIR /nikhil
# COPY mvn-webapp-demo.war /usr/local/tomcat/webapps/mvn-webapp-demo.war
# COPY /target/*.war /usr/local/tomcat/webapps/mvn-webapp-demo.war
COPY . /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
