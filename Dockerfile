# docker build -t website:version0.1 .
# docker run --rm -it -v ${PWD}:/app -v ${HOME}:${HOME} -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --user $(id -u):$(id -g) website:version0.1 bash
# Nikola 8.0.0b2 doesn's support python3.7
FROM python:3.6
COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y locales && \
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections && \
    echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections && \
    rm "/etc/locale.gen" && \
    dpkg-reconfigure --frontend noninteractive locales && \
    # curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    # apt-get install -y nodejs && \
    # npm install less && \
    pip install --upgrade pip setuptools ghp-import2 && pip install -r requirements.txt && \ 
    # pip install Nikola notebook && \
    nikola theme -i bnw

CMD ["python"]
