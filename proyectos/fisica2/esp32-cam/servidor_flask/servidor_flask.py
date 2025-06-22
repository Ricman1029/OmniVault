# servidor_flask.py
from flask import Flask, request
import datetime

app = Flask(__name__)

@app.route('/', methods=['POST'])
def recibir_foto():
    now = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = f"foto_{now}.jpg"
    with open(filename, 'wb') as f:
        f.write(request.data)
    print(f"Guardada: {filename}")
    return "Imagen recibida", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
