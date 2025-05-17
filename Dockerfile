# Use official Python image with Debian-based system
FROM python:3.10-slim

# Install system dependencies for dlib and face_recognition
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libboost-all-dev \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the entire app code to the container
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port (Flask default)
EXPOSE 5000

# Command to run your app
CMD ["python", "app.py"]
