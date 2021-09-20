# # syntax=docker/dockerfile:1
# FROM node:12-alpine
# RUN apk add --no-cache python g++ make
# WORKDIR /app
# COPY . .
# RUN yarn install --production
# CMD ["node", "src/index.js"]



# syntax=docker/dockerfile:1
FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]
# 这个是显然是普通的node程序的开发环境。

