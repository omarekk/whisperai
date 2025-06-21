# Use slim Python image
FROM python:3.10-slim

# Install system dependencies: git + ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    apt-get clean

# Set up work directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy your app code
COPY . .

# Expose and run app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
