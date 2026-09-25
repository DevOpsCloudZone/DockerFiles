# Java Spring Boot Multi-Stage Docker

## Maven Lifecycle

1. **validate** – Validates the Maven project and checks that the POM is correct.
2. **compile** – Compiles the Java source code from `src/main/java`.
3. **test** – Compiles and runs the unit tests.
4. **package** – Packages the compiled application into a JAR file.
5. **verify** – Performs additional checks to verify the package meets quality criteria.
6. **install** – Installs the generated artifact into the local Maven repository (`~/.m2`).
7. **deploy** – Publishes the artifact to a remote Maven repository such as Nexus or Artifactory.

## Maven Commands Practiced

- `mvn validate` – Validated the Maven project.
- `mvn compile` – Compiled the Java application.
- `mvn test` – Executed the application tests.
- `mvn package` – Created the Spring Boot executable JAR.
- `mvn install` – Installed the JAR into the local Maven repository.
- `mvn clean package` – Removed previous build output and created a fresh JAR.
- `mvn dependency:go-offline` – Downloaded and resolved project dependencies in advance.
- `mvn sonar:sonar` – Executes the SonarQube analysis goal through the Sonar Maven plugin.

## Multi-Stage Docker Build

1. **Stage 1 – Dependencies** – Uses Maven and Java 17 to download project dependencies.
2. **Stage 2 – Builder** – Uses the dependencies stage, copies source code, and runs `mvn package`.
3. **Stage 3 – Runtime** – Uses a Java 17 JRE image and copies only the generated JAR.
4. **Container Startup** – Runs the Spring Boot application using `java -jar`.

## Application

- **Language:** Java 17
- **Framework:** Spring Boot
- **Build Tool:** Maven


## Maven Concepts

- **Lifecycle Phase** – A predefined stage in Maven's build lifecycle such as `compile`, `test`, `package`, and `install`.
- **Plugin** – A Maven component that provides specific functionality.
- **Goal** – A specific task provided by a Maven plugin.
- `mvn dependency:go-offline` – Uses the Dependency Plugin and its `go-offline` goal to resolve/download dependencies.
- `mvn sonar:sonar` – Uses the Sonar Maven Plugin and its `sonar` goal to perform SonarQube analysis.

## Docker Multi-Stage Concepts

- **Build Stage** – Contains the tools required to compile and package the application.
- **Runtime Stage** – Contains only the runtime components required to execute the application.
- **`COPY --from`** – Copies files from a previous Docker stage into the current stage.
- **Docker Layer Caching** – Keeping `pom.xml` separate from source code allows dependency layers to be reused when only source code changes.
- **Build Image vs Runtime Image** – Maven/JDK are required during the build, while the final application only requires the Java runtime.
- **Working Directory** – `/app` is used as the working directory inside the containers.

## Docker Build Flow

pom.xml
   ↓
Download Dependencies
   ↓
Copy Source Code
   ↓
mvn package
   ↓
Spring Boot JAR
   ↓
Copy JAR to Runtime Image
   ↓
java -jar app.jar




Dockerfile Stages
## Stage 1 – Dependencies
Uses Maven with Java 17.
Copies only pom.xml.
Runs mvn dependency:go-offline.
Prepares the Maven dependency cache.
## Stage 2 – Builder
Continues from the dependencies stage.
Copies the src directory.
Runs mvn package.
Produces the executable Spring Boot JAR.
## Stage 3 – Runtime
Uses a Java 17 JRE image.
Does not contain Maven.
Copies only the generated JAR from the builder stage.
Exposes port 8080.
Starts the application using java -jar.
### Useful Commands
mvn validate
mvn compile
mvn test
mvn package
mvn install
mvn clean
mvn clean package
mvn dependency:go-offline

## Docker commands:

docker build -t java-springboot-app .
docker images
docker run -d -p 8080:8080 java-springboot-app
docker ps
docker logs <container-id>
docker stop <container-id>
docker rm <container-id>
- **Application Port:** 8080
- **Packaging:** Executable JAR
- **Containerization:** Docker Multi-Stage Build
