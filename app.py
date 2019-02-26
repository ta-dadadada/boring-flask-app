import os
from flask import Flask, render_template


class Counter:
    def __init__(self):
        self.total = 0

    def up(self):
        self.total += 1


app = Flask(__name__)
counter = Counter()


@app.route('/')
def home():
    counter.up()
    return render_template('home.html', count=counter.total)


if __name__ == '__main__':
    app.run(host=os.environ.get('FLASK_HOST'), port=os.environ.get('FLASK_PORT'))
