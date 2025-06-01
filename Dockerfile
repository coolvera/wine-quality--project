# Use lightweight Python base image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy app and model files
COPY app.py .
COPY requirements.txt .
COPY wine_quality_model.joblib .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5001

# Start the app
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]
