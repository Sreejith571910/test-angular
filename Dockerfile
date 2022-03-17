FROM node:latest
#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /usr/src/app
COPY . /usr/src/app/
#COPY package*.json ./
#RUN npm init -y
RUN npm install
RUN ng build

# Stage 2: Serve app with nginx server
FROM nginx:latest
COPY --from=build /usr/local/app/dist/sample-angular-app /usr/share/nginx/html
EXPOSE 80
#RUN npm install nodemon
#COPY ./index.js /usr/src/app/
#CMD [ "npm", "start" ]
