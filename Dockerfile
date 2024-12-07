# Use the appropriate base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy only requirements first to leverage Docker's caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Ensure the application runs on Heroku's dynamic port
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port $PORT"]