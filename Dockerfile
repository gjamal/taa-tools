# Use Python 3.13 slim image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy the application code
COPY . .

# Use PORT environment variable with a default
ENV PORT=8080

# Command to run the application
CMD exec gunicorn --bind :$PORT app.wsgi:app
