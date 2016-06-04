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
os.chdir(os.path.dirname(os.path.realpath(__file__))) #Change the directory where python is looking into the current directory (where the main.py file resides)

engine = create_engine('mysql://' + CONFIG_MYSQL_USERNAME + ':' + CONFIG_MYSQL_PASSWORD + '@' + CONFIG_MYSQL_IP + ':' + str(CONFIG_MYSQL_PORT) + '/' + CONFIG_MYSQL_DATABASE)
connection = engine.connect() #Connects to the mysql database

@app.route("/github-update", methods=["POST"]) #This is a github webhook. GitHub and ONLY github should visit the page, and they only do so via a POST request.
def github_update(): #This whole function happens after you hit that little push button on your git kraken :)
    h = hmac.new(CONFIG_GITHUB_WEBOOK_SECRET, request.data, hashlib.sha1) #Lets unhash whatever password github gave us with the password in our config
    if h.hexdigest() != request.headers.get("X-Hub-Signature", "")[5:]:  # A timing attack here is nearly impossible. // Then we compare if the passwords are equal
        return "FAIL" #If they are no equal, then return FAIL. else continue
    try:
        subprocess.Popen("git pull", shell=True).wait() #Run a command git pull that gets all the newest data
    except OSError: #If the server decideds to do something stupid with running the command, well we get an error
        return "ERROR"
    return "OK" #Otherwise, it should return OK

# This is the home page. aka index :)
@app.route("/")
def index():
    return render_template("site.html.jinja2") #renders index.html.jinja2 from the templates folder

@app.route("/storyline/<id>") #Javascript should visit this page and get the mysql data. The ID will be passed in from the header of the browser/JS. And the ID will correspond with the row in the DB.
def storyline(id): #Now take in the ID in the definition
    query = """SELECT * FROM storyline WHERE id ='{0}'""".format(id) #gets the row with the ID in the database
    mysql = connection.execute(query) #Executes in the database
    for x in mysql: #For each row returned from the database...
        story = str(x["story"]) #Set them in a variable
        btn1_txt = x["btn1_txt"]
        btn1_loc = str(x["btn1_loc"])
        btn2_txt = x["btn2_txt"]
        btn2_loc = str(x["btn2_loc"])
        btn3_txt = x["btn3_txt"]
        btn3_loc = str(x["btn3_loc"])
        quicktimeplayer_enabled = str(x["quicktimeplayer_enabled"])
        quicktimeplayer_seconds = str(x["quicktimeplayer_seconds"])
        quicktimeplayer_nextoption = str(x["quicktimeplayer_nextoption"])
        bgimg = str(x["bgimg"]) #For the line below, return a JSON version of each of the variables so javascript can use it later on.
    return jsonify(story=story, btn1_txt=btn1_txt, btn1_loc=btn1_loc, btn2_txt=btn2_txt, btn2_loc=btn2_loc, btn3_txt=btn3_txt, btn3_loc=btn3_loc, quicktimeplayer_enabled=quicktimeplayer_enabled, quicktimeplayer_seconds=quicktimeplayer_seconds, quicktimeplayer_nextoption=quicktimeplayer_nextoption, bgimg=bgimg)

@app.route("/donate") #If the user visits the donate page in the url ""/donate"
def donate():
	return render_template("donate.html") #Hurl them a page called donate.html in the templates folder

@app.route("/credit")
def credit():
	return render_template("datboi.html")

# basically this if statement below says, if you run this file DIRECTLY, then anything in the if statement runs. Used for debug purpouses only
# as we do not want flask's development modules to be running on pythonanywhere (or other deployed environments), or people would see our code, and
# it is very insecure for it to do so.
if __name__ == "__main__":
    app.run(host=CONFIG_FLASK_IP,port=CONFIG_FLASK_PORT,debug=CONFIG_FLASK_DEBUGMODE)
