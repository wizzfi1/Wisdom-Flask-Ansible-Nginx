FROM python:3.9-slim

WORKDIR /app

# Install curl for healthchecks
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/metrics || exit 1

EXPOSE 5000
CMD ["python", "app.py"]