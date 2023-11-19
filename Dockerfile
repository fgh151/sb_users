FROM eclipse-temurin:11-jdk-jammy as builder
WORKDIR /app
COPY . .
RUN gradlew build


FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
COPY --from=builder /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]