FROM cypress/browsers:chrome67

ENV YARN_VERSION 1.16.0

RUN npm install --global yarn@$YARN_VERSION
RUN yarn --version

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
USER node

RUN echo 'cd /home/node/app && ls -l' >> ~/.bashrc

CMD ["yarn", "install", "&&", "yarn", "test:prod"]
