# Prerequisites
=> Install JDK 25
=> Install maven

# Running the application in development mode
`./mvnw spring-boot:run`

# After adding any new package in pom.xml file run following fresh installation. 
`./mvnw clean install`
`./mvnw clean install -DskipTests`

# Building the application
`./mvnw clean package`

Make sure target folder is created with a `.jar` file inside.

# Running the build jar file
`java -jar <name of jar file>`

# Building the image
`docker build -t spring-boot-image .`

# Running the container
`docker run -d -p 8080:8080 --name spring-boot-application spring-boot-image`

# testing CI pipeline for Java