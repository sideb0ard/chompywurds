from flask import Flask, request, jsonify
app = Flask(__name__)
import MBSP


@app.route("/")
def hello():
    return "Chompy wurd - post me sum content..\n"

@app.route("/", methods=['POST'])
def chomp_wurds():
    wurds = request.json['wurds']

    print "Got wurds: " + wurds
    breakdown = MBSP.parse(wurds)
    return jsonify({'orig': wurds, 'breakdown': breakdown}), 201

if __name__ == "__main__":
    app.run(host='0.0.0.0')
