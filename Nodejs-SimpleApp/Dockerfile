FROM node:25-alpine
LABEL Nodejs appliaction
MAINTAINER Umesh Av
WORKDIR /app
COPY package.json ./
RUN npm install
COPY app.js ./
EXPOSE 3000
CMD ["npm", "start"]

