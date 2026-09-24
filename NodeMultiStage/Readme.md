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
