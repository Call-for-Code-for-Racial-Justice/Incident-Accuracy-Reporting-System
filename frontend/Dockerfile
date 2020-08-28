FROM ubuntu:18.04
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git curl -y
#RUN apt install nodejs npm -y
RUN apt install curl -y 
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y build-essential nodejs
RUN mkdir /root/frontend
COPY . /root/frontend/
RUN cd /root/frontend && npm install
