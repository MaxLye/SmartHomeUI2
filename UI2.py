from werkzeug.middleware.proxy_fix import ProxyFix
from flask import Flask,jsonify,request,render_template
import requests
import json

@app.route('/<area>')
def root():
  return render_template('testFlask.html', area = area)


if __name__ == "__main__":
  app.run(host='0.0.0.0',port=88,debug=True)