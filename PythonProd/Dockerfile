FROM python:3.12-slim-bookworm
WORKDIR /app
MAINTAINER umesh
LABEL python-flask-application="true"
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . . 
RUN useradd --create-home pythonuser && \
    chown -R pythonuser:pythonuser /app

EXPOSE 5000
USER pythonuser
CMD ["python","app.py"]
