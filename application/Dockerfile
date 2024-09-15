FROM openjdk:17-oracle
COPY aiv.jar /opt/run.jar
EXPOSE 8080
WORKDIR /opt/
ENTRYPOINT ["java","--add-opens=java.base/java.nio=ALL-UNNAMED","--add-exports=java.base/sun.nio.ch=ALL-UNNAMED","--add-opens=java.base/sun.nio.ch=ALL-UNNAMED","-Dspring.config.location=file:/opt/config/application.yml","-Dloader.path=/opt/config/drivers", "-cp", "run.jar","org.springframework.boot.loader.PropertiesLauncher"]
