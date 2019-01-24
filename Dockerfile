# docker build -t website:version0.1 .
# docker run -it --rm --name website website:version0.1 python
# Nikola 8.0.0b2 doesn's support python3.7
FROM python:3.6
COPY . /app
WORKDIR /app

RUN pip install --upgrade pip setuptools && pip install Nikola==8.0.0b2 notebook>=4.0.0

CMD ["python"]
