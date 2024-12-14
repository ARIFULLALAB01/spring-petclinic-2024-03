FROM maven:3.9.9-amazoncorretto-17-alpine
LABEL Director="Arif"
LABEL ASSist-Director="Delli"
COPY . .
RUN mvn clean package -Dskiptest
EXPOSE 8080
CMD ["java", "-jar", "./target/*.jar"]