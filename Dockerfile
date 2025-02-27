FROM eclipse-temurin:21 as build

WORKDIR /app
COPY . .

RUN <<EOF
./gradlew bootJar
mv build/libs/*.jar app.jar
EOF

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /app/app.jar .

CMD ["java", "-jar", "app.jar"]
EXPOSE 8080