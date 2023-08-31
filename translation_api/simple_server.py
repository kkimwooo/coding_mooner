from flask import Flask
from flask import Flask, jsonify, request
import subprocess

app = Flask(__name__)
  
@app.route('/eng2kor', methods=['POST'])
def to_Korean():
    req=request.get_json()['req']
    child=subprocess.Popen(["./eng2kor.sh",req], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (stdout, stderr)=child.communicate()
    return stdout.decode('UTF-8')

@app.route('/kor2eng', methods=['POST'])
def to_English():
    req=request.get_json()['req']
    child=subprocess.Popen(["./kor2eng.sh",req], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (stdout, stderr)=child.communicate()
    return stdout.decode('UTF-8')

if __name__ == "__main__":
    app.run(port=4890)

