FROM amazoncorretto:17-alpine3.17-jdk
LABEL Director="Arif"
LABEL ASSist-Director="Delli"
ADD https://dhilleproject1.s3.ap-south-1.amazonaws.com/spring-petclinic-3.2.0-SNAPSHOT.jar ./spring-petclinic-3.2.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar"]