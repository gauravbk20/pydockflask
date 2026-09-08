# Step 1: Use the official Python 3.13 slim image
FROM python:3.13-slim

# Step 2: Set production environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_ENV=production

# Step 3: Set the working directory inside the container
WORKDIR /app

# Step 4: Install system dependencies (optional, but good for security updates)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Step 5: Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Copy the rest of your application code
COPY . .

# Step 7: Create a non-root user for security
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

# Step 8: Expose the port Gunicorn will run on
EXPOSE 8000

# Step 9: Run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "app:app"]
