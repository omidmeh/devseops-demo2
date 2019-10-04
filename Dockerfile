#FROM node:10-alpine
FROM us.icr.io/oms-project3/node:10-alpine

WORKDIR /app
COPY package.json /app
# RUN npm install

# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies

COPY . /app
CMD node index.js
EXPOSE 8081

