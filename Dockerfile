# Use the official Python image from the Docker Hub
FROM python:3.12

# Create a non-root user
RUN useradd -m .vscode
USER .vscode

ENV PYTHONPATH=/app

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 8000 for the Django development server
EXPOSE 8000