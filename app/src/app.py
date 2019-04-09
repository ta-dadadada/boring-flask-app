from flask import Flask, render_template, jsonify


class Counter:
    def __init__(self):
        self.total = 0

    def up(self):
        self.total += 1


app = Flask(__name__)
counter = Counter()


@app.route('/')
@app.route('/health_check')
def health_check():
    return jsonify({'message': 'This is a boring flask application.'})


@app.route('/count')
def home():
    counter.up()
    return render_template('home.html', count=counter.total)
