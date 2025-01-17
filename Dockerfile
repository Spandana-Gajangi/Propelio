FROM node:13-alpine as builder

WORKDIR /usr/app

COPY package.json ./
COPY package-lock.json ./
RUN npm ci
COPY src src
COPY main.ts .
COPY webpack.config.ts .
COPY tsconfig.json .
EXPOSE 3000
CMD ["npm", "run", "start"]