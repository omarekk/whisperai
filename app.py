from flask import Flask, request, jsonify
import whisper
import tempfile
import os

app = Flask(__name__)
model = whisper.load_model(os.getenv("WHISPER_MODEL", "base"))

@app.route("/")
def health():
    return "WhisperAI is running"

@app.route("/transcribe", methods=["POST"])
def transcribe():
    if 'file' not in request.files:
        return jsonify({"error": "No file uploaded"}), 400

    file = request.files["file"]
    with tempfile.NamedTemporaryFile(suffix=".wav", delete=True) as tmp:
        file.save(tmp.name)
        result = model.transcribe(tmp.name)
    return jsonify(result)
