FROM python:3.7
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

RUN git config --global url."https://".insteadOf git:// && \
    git config --global user.name "dgjustice" && \
    git config --global user.email "djustice@wificidr.net" && \
    git config --global credential.helper "/bin/bash /app/credentials.sh"

CMD ["python"]
