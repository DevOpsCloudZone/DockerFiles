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

ing containers.
