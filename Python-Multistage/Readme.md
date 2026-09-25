# Python Flask Multi-Stage Docker

## Python Application

- **Language:** Python
- **Framework:** Flask
- **Dependency Manager:** pip
- **Application Port:** 5000
- **Containerization:** Docker Multi-Stage Build

## Python Environment

- **Virtual Environment (`venv`)** – Creates an isolated Python environment for application dependencies.
- `python3 -m venv venv` – Creates a virtual environment named `venv`.
- `source venv/bin/activate` – Activates the virtual environment in the current shell.
- `pip install -r requirements.txt` – Installs the dependencies defined in `requirements.txt`.
- `python app.py` – Starts the Python Flask application.

## Python Dependency Management

- **`requirements.txt`** – Defines the Python packages required by the application.
- **`pip`** – Python package installer used to install application dependencies.
- **`--no-cache-dir`** – Prevents pip from storing its package download cache, helping reduce unnecessary image contents.

## Manual Application Flow

requirements.txt
        ↓
Create Virtual Environment
        ↓
Activate venv
        ↓
pip install -r requirements.txt
        ↓
python app.py
        ↓
Flask Application Running


# Multi-Stage Docker Build
- **Builder Stage** – Contains the environment and tools required to prepare the Python application.
- **Runtime Stage** – Contains the Python runtime, application code, and required dependencies needed to run the application.
- **Virtual Environment** – Keeps application Python packages isolated from the system Python environment.
- **`COPY --from`** – Copies files from the builder stage into the runtime stage.
- **Docker Layer Caching** – Copying `requirements.txt` before application source code allows dependency layers to be reused when source code changes.
- **Build Image vs Runtime Image** – The build stage prepares dependencies, while the runtime stage is responsible only for running the application.
- **Application Startup** – The runtime container starts the Flask application using Python.

Dockerfile Stages
## Stage 1 – Builder
- Uses a Python base image.
- Sets the working directory.
- Copies `requirements.txt`.
- Creates a Python virtual environment.
- Installs dependencies using `pip`.
- Uses `--no-cache-dir` to avoid pip's package cache.
## Stage 2 – Runtime
- Uses a clean Python image.
- Sets the working directory.
- Copies the prepared virtual environment from the builder stage.
- Copies the application source code.
- Configures the virtual environment in `PATH`.
- Starts the Flask application.
## Docker Build Flow

requirements.txt
        ↓
Create Python Virtual Environment
        ↓
Install Dependencies
        ↓
Copy Application Code
        ↓
Copy Virtual Environment to Runtime
        ↓
Python Runtime
        ↓
python app.py
        ↓
Flask Application

## Useful Commands

### Python

- `python3 -m venv venv` – Creates a Python virtual environment named `venv`.
- `source venv/bin/activate` – Activates the Python virtual environment.
- `pip install -r requirements.txt` – Installs the dependencies listed in `requirements.txt`.
- `python app.py` – Starts the Flask application.

### Docker

- `docker build -t python-flask-app .` – Builds the Docker image using the Dockerfile.
- `docker images` – Lists Docker images available on the system.
- `docker run -d -p 5000:5000 python-flask-app` – Creates and runs the container in detached mode and maps port 5000.
- `docker ps` – Lists currently running containers.
- `docker logs <container-id>` – Displays logs from the specified container.
- `docker stop <container-id>` – Stops the specified running container.
- `docker rm <container-id>` – Removes the specified stopped container.

## Key Concepts Learned

### Python

- **Python Virtual Environments** – Isolates application dependencies from the system Python environment.
- **pip Dependency Management** – Uses `pip` to install and manage Python packages.
- **`requirements.txt`** – Defines the Python dependencies required by the application.
- **`--no-cache-dir`** – Prevents pip from retaining its package download cache.

### Docker

- **Docker Multi-Stage Builds** – Separates application preparation/build activities from the runtime environment.
- **Builder and Runtime Stages** – Uses one stage to prepare dependencies and another stage to run the application.
- **`COPY --from`** – Copies files from one Docker build stage to another.
- **Docker Layer Caching** – Allows unchanged build layers, such as dependency installation, to be reused.
- **Python Runtime Configuration** – Configures the Python environment required to run the application.
- **Flask Application Containerization** – Packages and runs the Flask application inside a Docker container.

### One important difference from your Java project

Java uses a **Maven lifecycle**:


validate → compile → test → package → install → deploy

Python doesn't have an equivalent standard lifecycle built into pip.

Instead, the typical flow we practiced is:

venv
 ↓
pip install
 ↓
python app.py
