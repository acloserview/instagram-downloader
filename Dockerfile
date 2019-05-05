FROM python:3.7-stretch


RUN apt-get update && apt-get install -yq \
    firefox-esr \
    chromium \
    git-core \
    xvfb \
    xsel \
    unzip \
    python-pytest \
    libgconf2-4 \
    libncurses5 \
    libxml2-dev \
    libxslt-dev \
    libz-dev \
    xclip=0.12+svn84-4+b1

# GeckoDriver v0.19.1
RUN wget -q "https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz" -O /tmp/geckodriver.tgz \
    && tar zxf /tmp/geckodriver.tgz -C /usr/bin/ \
    && rm /tmp/geckodriver.tgz

# chromeDriver v2.35
RUN wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/bin/ \
    && rm /tmp/chromedriver.zip

RUN wget -q "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" -O /tmp/phantomjs.tar.bz2 \
    && tar xvjf /tmp/phantomjs.tar.bz2 -C /usr/bin/ \
    && rm /tmp/phantomjs.tar.bz2

# create symlinks to chromedriver and geckodriver (to the PATH)
RUN ln -s /usr/bin/geckodriver /usr/bin/chromium-browser  \
    && chmod 777 /usr/bin/geckodriver \
    && chmod 777 /usr/bin/chromium-browser

RUN cp /usr/bin/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/
RUN chmod 777 /usr/bin/phantomjs

RUN pip3 install pyvirtualdisplay colorama termcolor selenium tabulate