FROM eclipse-temurin:21

WORKDIR /app
COPY . .

RUN <<EOF
./gradlew bootJar
mv build/libs/*.jar app.jar
EOF

CMD ["java", "-jar", "app.jar"]
EXPOSE 8080