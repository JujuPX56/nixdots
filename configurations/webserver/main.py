from flask import Flask, request, render_template
import os

message = ""

app = Flask("atable")

@app.route('/')
def index():
    return render_template('index.html') 

@app.route('/', methods=['POST'])
def getMessage():
    js_data = request.json  

    my_variable = js_data.get('my_variable')

    print(my_variable)

def sendMessage(message):
    os.system(f'notify-send "{message}"')
    os.system("pw-play notification.wav") 
