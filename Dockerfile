FROM python:3.10

RUN apt-get update && apt-get install -y ffmpeg git && apt-get clean

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install .

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
