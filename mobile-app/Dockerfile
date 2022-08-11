# pull base image
FROM node:14.13.1-buster-slim

# install necessary package(s)
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# default to port 19000 for node, and 19001 and 19002 (tests) for debug
ARG PORT=19000
ENV PORT $PORT
EXPOSE $PORT 19001 19002

# install global packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH /home/node/.npm-global/bin:$PATH
RUN npm i --unsafe-perm --allow-root -g npm@latest expo-cli@latest

# pull repo
RUN cd /opt && \
    git clone -c http.sslVerify=false https://github.com/Call-for-Code-for-Racial-Justice/Incident-Accuracy-Reporting-System.git && \
    cd Incident-Accuracy-Reporting-System && \
    git -c http.sslVerify=false checkout mobile-app && \
    git -c http.sslVerify=false pull && \
    cd mobile-app
WORKDIR /opt/Incident-Accuracy-Reporting-System/mobile-app
RUN npm install

CMD npm start