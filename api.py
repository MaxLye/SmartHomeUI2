from werkzeug.middleware.proxy_fix import ProxyFix
from flask import Flask,jsonify,request
from flask_cors import CORS
import mysql.connector
import requests
import json

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)
CORS(app)
dbConfig = {
  'user': 'maxlye',
  'password': 'MaxLye934512',
  'host': '192.168.31.16',
  'database': 'smarthome',
  'raise_on_warnings': True,
  'autocommit':True
}
cnx = mysql.connector.connect(**dbConfig)
cursor = cnx.cursor()

@app.route('/')
def root():
  return "connection success"

@app.route('/action/<area>/<switch>/<action>',methods=['POST'])
def action(area,switch,action):
  actionToMake = "nothing"
  if (action == 'on'):
    actionToMake = "turnOn"
  elif action == 'off':
    actionToMake = "turnOff"
  resp = {}
  data = request.form.to_dict(flat=False)
  if (checktoken(data['token'][0])):
    switchAvailable = False
    query = "select s.ID,a.EndpointIP,s.Status from area a,switch s where a.ID=s.AreaID and a.EName='"+area+"' and s.EName='"+switch+"'"
    cursor.execute(query)
    rows = cursor.fetchall()
    if (cursor.rowcount == 1):
      if (actionToMake == int(rows[0][2])):
        resp['message'] = "Switch conflict, no change made."
      else:
        resp['switchID'] = rows[0][0]
        resp['switchName'] = switch
        resp['switchStatus'] = actionToMake
        targetAddress = "https://"+rows[0][1]
        # print("TargetAddress : "+targetAddress)
        response = requests.get(targetAddress+"/"+actionToMake,params={'id': switch})
        resp['message'] = (response.content).decode("utf-8")
      query = "update switch set Status = "+('1' if actionToMake == "turnOn" else '0')+" where ID = "+str(resp['switchID'])
      cursor.execute(query)
      if cursor.rowcount == 1:
        resp['exeResult'] = "Success"
  return json.dumps(resp)

def checktoken(tokenFromClient):
  access = False
  query = "select Token from user where token='"+tokenFromClient+"'"
  cursor.execute(query)
  for (token) in cursor:
    if token[0] == tokenFromClient:
      access = True
      break
  return access

@app.route('/loadareas')
def loadAreas():
  query = "select Name,EName from area"
  cursor.execute(query)
  row_headers=[x[0] for x in cursor.description]
  rv = cursor.fetchall()
  json_data=[]
  for result in rv:
    json_data.append(dict(zip(row_headers,result)))
  return json.dumps(json_data)
  pass

@app.route('/loaditems/<area>')
def loadItem(area):
  query = "select s.* from area a,switch s where a.EName='"+area+"' and a.ID=s.AreaID"
  cursor.execute(query)
  row_headers=[x[0] for x in cursor.description]
  rv = cursor.fetchall()
  json_data=[]
  for result in rv:
    json_data.append(dict(zip(row_headers,result)))
  return json.dumps(json_data)
  pass

if __name__ == "__main__":
  app.run(host='0.0.0.0',port=8000,debug=True)