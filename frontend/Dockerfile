#get the latest alpine image from node registry
FROM node:16.18.0-buster-slim AS build-stage

#set the working directory
WORKDIR /app

#copy the package and package lock files
#from local to container work directory /app
COPY package*.json /app/

#Run command npm install to install packages
RUN npm install

#copy all the folder contents from local to container
COPY . .

#create a react production build
RUN npm run build

#get the latest alpine image from nginx registry
FROM nginx:1.23.2

#we copy the output from first stage that is our react build
#into nginx html directory where it will serve our index file
COPY --from=build-stage /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/build/ /usr/share/nginx/html