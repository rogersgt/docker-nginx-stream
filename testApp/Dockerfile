FROM node:10

RUN mkdir -p /app
ADD index.js package.json yarn.lock /app/
ADD models /app/models

WORKDIR /app

RUN yarn

EXPOSE 5000

CMD yarn dev