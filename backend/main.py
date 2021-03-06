from flask import request
from app import create_app

app = create_app()

@app.route('/')
def index():
    return {
        "message" : "hello"
    }



@app.route('/flight', methods=['GET', 'POST'])
def function():
    pass 