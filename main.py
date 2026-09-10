from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
  return "Hello WC_logs_writ_vw_4 to Python flask world-got it !!"

if __name == '__main__':
  app.run(host='0.0.0.0',port=8080)
