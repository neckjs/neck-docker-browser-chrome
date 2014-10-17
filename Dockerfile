FROM ubuntu
MAINTAINER José Moreira <josemoreiravarzim@gmail.com>

RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update -y && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get install -y xvfb

xvfb-run -a google-chrome
