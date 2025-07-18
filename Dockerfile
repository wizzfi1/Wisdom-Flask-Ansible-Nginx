FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Ensure prometheus-flask-exporter is in requirements.txt

COPY app.py .

EXPOSE 5000
CMD ["python", "app.py"]  