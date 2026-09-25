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


#Multi-Stage Docker Build
## Stage 1 – Builder – Creates the Python virtual environment and installs application dependencies.
## Stage 2 – Runtime – Uses a clean Python image and copies the prepared virtual environment.
Application Startup – Runs the Flask application using Python.
Docker Multi-Stage Concepts
Builder Stage – Contains the environment required to prepare the Python application.
Runtime Stage – Contains only the Python runtime, application code, and required dependencies.
Virtual Environment – Keeps application Python packages isolated from the system Python environment.
COPY --from – Copies files from the builder stage into the runtime stage.
Docker Layer Caching – Copying requirements.txt before application source code allows dependency installation layers to be reused when source code changes.
Build Image vs Runtime Image – Build-stage operations prepare dependencies, while the runtime stage is responsible only for running the application.
Dockerfile Stages
## Stage 1 – Builder
Uses a Python base image.
Sets the working directory.
Copies requirements.txt.
Creates a Python virtual environment.
Installs dependencies using pip.
Uses --no-cache-dir to avoid pip's package cache.
## Stage 2 – Runtime
Uses a Python runtime image.
Sets the working directory.
Copies the virtual environment from the builder stage.
Copies the application source code.
Configures the virtual environment in PATH.
Starts the Flask application.
## Docker Build Flow
requirements.txt
        ↓
Create Python venv
        ↓
Install dependencies
        ↓
Copy application code
        ↓
Copy prepared venv to runtime
        ↓
Python runtime
        ↓
python app.py
        ↓
Flask Application

## Useful Commands
Python
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
## Docker
docker build -t python-flask-app .
docker images
docker run -d -p 5000:5000 python-flask-app
docker ps
docker logs <container-id>
docker stop <container-id>
docker rm <container-id>
## Key Concepts Learned
Python virtual environments
pip dependency management
requirements.txt
--no-cache-dir
## Docker multi-stage builds
Builder and runtime stages
COPY --from
Docker layer caching
Python runtime configuration
Flask application containerization

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
