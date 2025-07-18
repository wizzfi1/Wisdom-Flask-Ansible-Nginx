from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)
metrics.info('app_info', 'Wisdom App Info', version='1.0.0')

@app.route('/')
def home():
    return "🚀 Wisdom has been waiting for you, Welcome!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)