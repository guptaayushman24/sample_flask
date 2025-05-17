 FROM python:3.9
    WORKDIR /app
    COPY requirements.txt .
    
    RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        build-essential cmake && \
        rm -rf /var/lib/apt/lists/*
    
    RUN pip install --upgrade pip setuptools
    RUN pip install cmake
    RUN pip install dlib
    RUN pip install -r requirements.txt
    
    COPY . .
    
    CMD ["python", "app.py"]