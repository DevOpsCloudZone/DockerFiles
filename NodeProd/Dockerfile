FROM node:alpine
MAINTAINER Umesh
LABEL node app with simple prod style
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
# COPY --chown=node:node . .
EXPOSE 5000
USER node
#CMD ["node","index.js"]
CMD ["npm","start"]

