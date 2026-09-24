FROM node:22-alpine AS dependencies
MAINTAINER Umesh
LABEL node app with simple prod style="true"
WORKDIR /app
COPY package*.json ./
#RUN npm install --production
# RUN npm ci ---------------> npm ci is used for packagelock.json
Run npm install # --production


FROM node:22-alpine AS build 
WORKDIR /app
# COPY --chown=node:node . .
COPY --from=dependencies /app/node_modules ./node_modules
COPY . .
RUN npm run build


FROM node:22-alpine AS Final
WORKDIR /app
COPY package*.json ./

#RUN npm ci --omit=dev ---------------> used for pacakagelock.json
RUN npm install --omit=dev
COPY --from=build /app/dist ./dist
COPY --chown=node:node . .
EXPOSE 5000
USER node
#CMD ["node","index.js"]
#CMD ["npm","start"]
CMD ["node","dist/index.js"]

