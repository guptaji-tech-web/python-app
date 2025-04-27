# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the hello.py into the container at /app
COPY hello.py /app

# Copy the requirements.txt into the container at /app
COPY requirements.txt /app

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "hello.py"]
