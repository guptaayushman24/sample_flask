# Base image with Python and necessary build tools
FROM python:3.9-slim

# Install dependencies for face_recognition and dlib
RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    libboost-all-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python packages (face_recognition included)
RUN pip install --upgrade pip
RUN pip install face_recognition flask

# Expose the port your app runs on
EXPOSE 5000

# Run your app
CMD ["python", "app.py"]
