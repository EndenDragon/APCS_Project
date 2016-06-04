# APCS_Project

**Some Lost - Spring 2016**

The project purpose is to demonstrate the use of Web Development and Database. Written using Flask framework (Python), this small, yet powerful tool allows us to communicate with MySQL database directly. Both the site and MySQL database are hosted on PythonAnywhere.

Please note, when pushing the python files, it **WILL NOT** be reflected on the server. Please contact Jeremy for him to reload the site for the changes to take effect. Otherwise, other files (Javascript, images, html, etc) will take immediate effect when pushed onto the git.

## The Team

**The ones who are in the group and that contributed to the project**
* Jeremy
* Michelle
* Kevin
* Adrian
* Chuwei

## The structure

Basically, Flask will directly communicate with the database and provide a page (`/storyline`) where the results can be shown in a JSON output. Flask will also map out the pages that can be reached from the browser. Javascript will then be used to read the JSON and interpret what to do next (From showing the storylines on the screen, to the quicktime implementations, etc).

## Files

**Significant files and their purposes**

* main.py - The main python file, with flask and stuff
* /static/ - Stores CSS, javascript, images, and other static files. Files can be reached from `/static` url after the domain
* /templates/ - HTML files used for rendering the site
* /static/js/script.js - The main javascript file used along the site

***

**Please note, the project is in demo. So please expect hiccups every now and then.**
