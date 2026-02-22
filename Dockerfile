# STAGE 1: The Build Environment 
# We use JDK 25 to compile and package the application.
FROM eclipse-temurin:25-jdk-alpine AS build_stage
WORKDIR /app

# Step A: Copy Maven wrapper and pom.xml to cache dependencies
# This is a DevOps best practice so we don't re-download jars every time code changes.
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

# Step B: Copy the actual source code and build the "Invisible" JAR
COPY src ./src
RUN ./mvnw clean package -DskipTests

# STAGE 2: The Runtime Environment 
# We switch to the JRE (Runtime) to keep the image small and secure.
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Step C: Copy ONLY the compiled .jar file
# We discard the 500MB+ of build tools and source code here.
COPY --from=build_stage /app/target/*.jar app.jar

# Step D: Security - Create a non-root user
# In production, we never run applications as 'root' to prevent hacking.
RUN addgroup -S devopsgroup && adduser -S devopsuser -G devopsgroup
RUN chown devopsuser:devopsgroup app.jar
USER devopsuser

# Step E: Execution
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]