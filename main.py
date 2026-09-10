from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
  return "Hello Welcome to Python flask world v2.0 got it !!"

if __name == '__main__':
  app.run(host='0.0.0.0',port=8080)
