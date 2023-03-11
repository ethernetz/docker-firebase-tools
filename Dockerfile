FROM node:16-alpine3.16

# Firebase emulators need java to run 
RUN apk add openjdk11 git

# Need permissions to create directories
USER node

# In order to install global dependencies, put dependencies in non-root user path 
# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#global-npm-dependencies
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN npm install -g firebase-tools@latest