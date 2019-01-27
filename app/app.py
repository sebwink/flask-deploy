import os
import time
from flask import Flask

HOST = os.getenv('HOST', 'localhost')
PORT = os.getenv('PORT', 5000)
DEPLOY = os.getenv('DEPLOY', False)
DEBUG = not bool(DEPLOY)

app = Flask(__name__)

@app.route('/<t>')
def delay(t):
    try:
        t = int(t)
    except:
        return 'Invalid delay.\n'
    time.sleep(t)
    return 'Done.\n'

@app.route('/')
def immediate():
    return 'Done.\n'

if __name__ == '__main__':
    app.run(HOST, PORT, DEBUG)
