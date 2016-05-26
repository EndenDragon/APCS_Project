from flask import Flask, render_template, jsonify, request #imports flask and rendering of the external HTML template files, etc
from config import * #This line gets all the variables from config.py file
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy import *
import MySQLdb
import hmac
import hashlib
import subprocess
import os

app = Flask(__name__)
os.chdir(os.path.dirname(os.path.realpath(__file__)))

engine = create_engine('mysql://' + CONFIG_MYSQL_USERNAME + ':' + CONFIG_MYSQL_PASSWORD + '@' + CONFIG_MYSQL_IP + ':' + str(CONFIG_MYSQL_PORT) + '/' + CONFIG_MYSQL_DATABASE)
connection = engine.connect() #Connects to the mysql database

@app.route("/github-update", methods=["POST"])
def github_update():
    h = hmac.new(CONFIG_GITHUB_WEBOOK_SECRET, request.data, hashlib.sha1)
    if h.hexdigest() != request.headers.get("X-Hub-Signature", "")[5:]:  # A timing attack here is nearly impossible.
        return "FAIL"
    try:
        subprocess.Popen("git pull", shell=True).wait()
    except OSError:
        return "ERROR"
    return "OK"

# This is the home page. aka index :)
@app.route("/")
def index():
    return render_template("site.html.jinja2") #renders index.html.jinja2 from the templates folder

@app.route("/storyline/<id>")
def storyline(id):
    query = """SELECT * FROM storyline WHERE id ='{0}'""".format(id) #gets the row with the ID in the database
    mysql = connection.execute(query)
    for x in mysql:
        story = str(x["story"])
        btn1_txt = x["btn1_txt"]
        btn1_loc = str(x["btn1_loc"])
        btn2_txt = x["btn2_txt"]
        btn2_loc = str(x["btn2_loc"])
        btn3_txt = x["btn3_txt"]
        btn3_loc = str(x["btn3_loc"])
        quicktimeplayer_enabled = str(x["quicktimeplayer_enabled"])
        quicktimeplayer_seconds = str(x["quicktimeplayer_seconds"])
        bgimg = str(x["bgimg"])
    return jsonify(story=story, btn1_txt=btn1_txt, btn1_loc=btn1_loc, btn2_txt=btn2_txt, btn2_loc=btn2_loc, btn3_txt=btn3_txt, btn3_loc=btn3_loc, quicktimeplayer_enabled=quicktimeplayer_enabled, quicktimeplayer_seconds=quicktimeplayer_seconds, bgimg=bgimg)

# basically this if statement below says, if you run this file DIRECTLY, then anything in the if statement runs. Used for debug purpouses only
# as we do not want flask's development modules to be running on pythonanywhere (or other deployed environments), or people would see our code, and
# it is very insecure for it to do so.
if __name__ == "__main__":
    app.run(host=CONFIG_FLASK_IP,port=CONFIG_FLASK_PORT,debug=CONFIG_FLASK_DEBUGMODE)
