FROM amazoncorretto:17-alpine AS build

WORKDIR /app

COPY mvnw .mvn pom.xml src ./

RUN ./mvnw clean package -DskipTests

FROM amazoncorretto:17-alpine

WORKDIR /app

COPY --from=build /app/target/vitaflow-0.0.1-SNAPSHOT.jar vitaflow.jar

EXPOSE 8080

CMD ["java", "-jar", "vitaflow.jar"]
