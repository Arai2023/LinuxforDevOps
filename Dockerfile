# Use Python base image
FROM python:3.12-slim

WORKDIR /app

# Copy all files from current directory into container
COPY . /app

# Optional: install Python dependencies if you have requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# Default command for testing
CMD ["python3", "-m", "http.server", "8080"]


