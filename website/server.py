from flask import Flask, render_template, url_for, request
import jinja2

app = Flask(__name__)

@app.route("/")
def index():
    # name = request.args.get("name")
    return render_template("index.html")

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/services")
def services():
    return render_template("service.html")

@app.route("/project")
def project():
    return render_template("project.html")

@app.route("/feature")
def feature():
    return render_template("feature.html")

@app.route("/team")
def team():
    return render_template("team.html")

@app.route("/quote")
def quote():
    return render_template("quote.html")

@app.route("/testimonial")
def testimonial():
    return render_template("testimonial.html")

@app.route("/error")
def error():
    return render_template("404.html")

@app.route("/contact")
def contact():
    return render_template("contact.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)