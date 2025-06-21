from flask import Flask, request, jsonify
import whisper
import tempfile

app = Flask(__name__)
model = whisper.load_model("base")

@app.route('/transcribe', methods=['POST'])
def transcribe():
    file = request.files['file']
    with tempfile.NamedTemporaryFile(suffix=".wav") as tmp:
        file.save(tmp.name)
        result = model.transcribe(tmp.name)
    return jsonify(result)
