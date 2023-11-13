FROM tomcat:8-jre8
RUN rm -rf /usr/local/tomcat/webapps/*
COPY /target/*.war /usr/local/tomcat/webapps/mvn-webapp-demo.war
# COPY /nikhil/workspace/devops/mvn-webapp-demo/target/*.war /usr/local/tomcat/webapps/mvn-webapp-demo.war
# RUN pwd >> pwd.txt
EXPOSE 8080
CMD ["catalina.sh", "run"]
