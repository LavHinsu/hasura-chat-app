FROM node:12.18.4 as base
WORKDIR /app
COPY ./package.json package.json
RUN npm install
RUN npm install -g serve
COPY . .


FROM base as staging
WORKDIR /app
RUN npm run build:stage
ENTRYPOINT PORT=3002 serve -s build

FROM base as production
WORKDIR /app
RUN npm run build:prod
ENTRYPOINT PORT=3002 serve -s build

EXPOSE 3002