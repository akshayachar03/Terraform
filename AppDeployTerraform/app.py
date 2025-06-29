from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
# This is a simple Flask application that serves an HTML page.
# It listens on all interfaces at port 80.