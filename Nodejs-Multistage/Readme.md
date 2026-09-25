# Node.js Multi-Stage Docker Application

## Installation & Setup

1. Install Node.js and npm, then verify:
   `node --version` and `npm --version`

2. Install project dependencies:
   `npm install`

3. `package.json` defines the application details, scripts, and dependencies, while `package-lock.json` stores the exact resolved dependency versions.

4. `node_modules` contains the installed Node.js packages required by the application.

5. Build and run the application:
   `npm run build` → creates `dist/`
   `npm start` → runs the application.

6. Build and run with Docker:
   `docker build -t node-multistage .`
   `docker run -d --name nodeapp -p 1112:3000 node-multistage`
   
# Node.js Multi-Stage Docker

## Node.js Application

- **Language:** JavaScript / Node.js
- **Runtime:** Node.js
- **Package Manager:** npm
- **Dependency File:** `package.json`
- **Lock File:** `package-lock.json`
- **Application Port:** 3000
- **Containerization:** Docker Multi-Stage Build

## Node.js Dependency Management

- **`package.json`** – Defines the application metadata, dependencies, scripts, and project configuration.
- **`package-lock.json`** – Locks the exact dependency versions used by the project.
- **`npm install`** – Installs project dependencies and can create/update `package-lock.json`.
- **`npm ci`** – Performs a clean dependency installation based on `package-lock.json`.
- **`npm ci --omit=dev`** – Installs only production dependencies and excludes development dependencies.
- **`node_modules`** – Directory containing the installed Node.js packages.
- **npm Scripts** – Commands defined inside the `scripts` section of `package.json`.

## Node.js Application Flow
package.json
      +
package-lock.json
      ↓
Install Dependencies
      ↓
node_modules
      ↓
Run / Build Application
      ↓
Node.js Application
      ↓
Application Running

Multi-Stage Docker Build
Stage 1 – Builder
Node.js Base Image – Provides Node.js and npm required for the build.
Working Directory – Sets the directory where application files and commands will be executed.
package.json – Defines the application's dependencies and npm scripts.
package-lock.json – Locks dependency versions for reproducible installations.
Dependency Installation – Uses npm ci to install the dependencies.
Source Code – Copies the application source code into the build stage.
Build Command – Runs npm run build when the application has a build step.
Build Output – Produces the application files required by the runtime stage.
Stage 2 – Runtime
Runtime Base Image – Uses a clean Node.js image for running the application.
Working Directory – Sets the application directory inside the runtime container.
Application Files – Copies the required application files from the builder stage.
Production Dependencies – Uses npm ci --omit=dev when only production dependencies are required.
Development Dependencies – Keeps unnecessary development dependencies out of the runtime environment.
Application Port – Exposes the port used by the Node.js application.
Application Startup – Starts the application using the configured npm start command.
Docker Multi-Stage Concepts
Builder Stage – Contains the tools and dependencies required to prepare or build the Node.js application.
Runtime Stage – Contains only the components required to run the application.
COPY --from – Copies files from a previous Docker build stage into the current stage.
Docker Layer Caching – Copying package.json and package-lock.json before source code allows dependency installation layers to be reused when source code changes.
Production Dependencies – npm ci --omit=dev excludes development dependencies from the production environment.
Build Image vs Runtime Image – The build stage prepares the application, while the runtime stage is responsible only for running it.
node_modules – Contains the installed Node.js packages required by the application.
Multi-Stage Build – Keeps build-related tools and unnecessary files out of the final runtime image.
Docker Build Flow
package.json
      +
package-lock.json
      ↓
Install Dependencies
      ↓
Copy Source Code
      ↓
Build Application
      ↓
Application Build Output
      ↓
Copy Required Files to Runtime
      ↓
Node.js Runtime
      ↓
npm start
      ↓
Node.js Application
Useful Commands
Node.js / npm
node --version – Displays the installed Node.js version.
npm --version – Displays the installed npm version.
npm install – Installs project dependencies.
npm ci – Performs a clean dependency installation using the lock file.
npm ci --omit=dev – Installs only production dependencies.
npm run build – Runs the build script defined in package.json.
npm start – Starts the application using the configured start script.
npm test – Runs the configured test script.
npm run <script> – Runs a custom npm script.
Docker
docker build -t nodejs-app . – Builds the Docker image using the Dockerfile.
docker images – Lists available Docker images.
docker run -d -p 3000:3000 nodejs-app – Creates and runs the container in detached mode and maps host port 3000 to container port 3000.
docker ps – Lists currently running containers.
docker ps -a – Lists running and stopped containers.
docker logs <container-id> – Displays logs from the specified container.
docker stop <container-id> – Stops the specified running container.
docker rm <container-id> – Removes the specified stopped container.
docker rmi nodejs-app – Removes the specified Docker image.
Key Concepts Learned
Node.js
Node.js Runtime – Executes JavaScript outside the browser.
npm – Package manager used to install and manage Node.js dependencies.
package.json – Defines project dependencies, scripts, and application configuration.
package-lock.json – Locks dependency versions for reproducible installations.
node_modules – Stores the installed Node.js packages.
npm Scripts – Provides commands for building, testing, and starting the application.
npm install – Installs dependencies and can update the lock file.
npm ci – Provides a clean and reproducible dependency installation based on the lock file.
npm ci --omit=dev – Installs production dependencies without development dependencies.
Docker
Docker Multi-Stage Builds – Separates application build activities from the runtime environment.
Builder Stage – Provides the tools and dependencies required to build the application.
Runtime Stage – Provides the environment required to run the application.
COPY --from – Transfers required files between Docker build stages.
Docker Layer Caching – Reuses unchanged dependency layers to improve build efficiency.
Production Image – Keeps unnecessary build tools and development dependencies out of the runtime image.
Port Mapping – Maps a host port to the application's container port.
Container Logs – Used to inspect application output and troubleshoot containers.
Container Lifecycle – Includes creating, running, inspecting, stopping, and removing containers.
