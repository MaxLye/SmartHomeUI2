from werkzeug.middleware.proxy_fix import ProxyFix
from flask import Flask,jsonify,request,render_template
import requests
import json
app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)

@app.route('/<area>')
def area(area):
  return render_template('testFlask.html', area = area)

@app.route('/')
def root():
  return "Connection Successful"


if __name__ == "__main__":
  app.run(host='0.0.0.0',port=88,debug=True)