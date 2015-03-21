FROM ubuntu
MAINTAINER José Moreira <josemoreiravarzim@gmail.com>

RUN apt-get update -y && apt-get install -y \
    wget

# Add google repo to aptitude
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

RUN apt-get update -y && apt-get install -y \
  google-chrome-stable xvfb

xvfb-run -a google-chrome
