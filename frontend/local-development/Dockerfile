FROM node:16.18.0-buster-slim AS base

RUN npm -g install npm@latest

WORKDIR /app
COPY package.json package-lock.json ./

RUN npm install

COPY . .
EXPOSE 3000

CMD ["npm", "start"]