FROM python:3.10-slim

# Install required system packages
RUN apt-get update && apt-get install -y ffmpeg git && apt-get clean

# Set the working directory
WORKDIR /app

# Copy all code into container
COPY . .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install .

# Run the app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
