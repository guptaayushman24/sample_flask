# ✅ Use a prebuilt image that includes dlib, face_recognition, OpenCV, etc.
FROM bamos/face-recognition

# Set the working directory inside the container
WORKDIR /app

# Copy your app code into the container
COPY . /app

# (Optional) Install any other Python packages you might need
# Note: face_recognition, dlib, numpy, opencv-python etc. are already installed
RUN pip install flask

# Expose the port for the Flask app
EXPOSE 5000

# Set the command to run your Flask app
CMD ["python", "app.py"]
