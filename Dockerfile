FROM ubuntu:20.04

# Prevent interactive prompt during install
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    cmake \
    build-essential \
    libboost-all-dev \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install face_recognition (which includes dlib)
RUN pip3 install face_recognition flask

# Set working directory
WORKDIR /app

# Copy your app files
COPY . .

# Expose the port your Flask app runs on
EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
