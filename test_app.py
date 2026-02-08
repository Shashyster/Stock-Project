#!/usr/bin/env python3
"""
Simple test app to verify deployment works
"""
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def index():
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Test - Stock App</title>
        <style>
            body { font-family: Arial; padding: 40px; background: #1a1a1a; color: white; }
            h1 { color: #00ff88; }
        </style>
    </head>
    <body>
        <h1>✅ Deployment Working!</h1>
        <p>If you see this, your Flask app is deployed correctly.</p>
        <p>Now let's fix the main app...</p>
    </body>
    </html>
    '''

@app.route('/health')
def health():
    return {'status': 'ok', 'message': 'App is running'}

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5001))
    app.run(debug=False, host='0.0.0.0', port=port)
