FROM cypress/browsers:chrome67

# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# install chromium
# RUN apk -U --no-cache \
#     --allow-untrusted add \
#     zlib-dev \
#     chromium \
#     xvfb \
#     wait4ports \
#     xorg-server \
#     dbus \
#     ttf-freefont \
#     grep \ 
#     udev \
#     && apk del --purge --force linux-headers binutils-gold gnupg zlib-dev libc-utils \
#     && rm -rf /var/lib/apt/lists/* \
#     /var/cache/apk/* \
#     /usr/share/man \
#     /tmp/* \
#     /usr/lib/node_modules/npm/man \
#     /usr/lib/node_modules/npm/doc \
#     /usr/lib/node_modules/npm/html \
#     /usr/lib/node_modules/npm/scripts

# RUN apk -U --no-cache \
#     --allow-untrusted add \
#     xvfb

ENV YARN_VERSION 1.16.0

RUN npm install --global yarn@$YARN_VERSION
RUN yarn --version

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
USER node

# Create a user `node` in docker
# ENV USER root
# ENV GROUP nodeuser
# ENV UID 1008
# ENV GID 1008
# ENV HOME /home/$USER

# RUN groupadd --gid $GID $GROUP \
#   && useradd --uid $UID --gid $GID --shell /bin/bash --create-home --home $HOME $USER

# RUN mkdir -p cd /data/www/
# RUN chown -Rf $USER:$GROUP /data/www/

# Setup change directory in .bashrc
RUN echo 'cd /home/node/app && ls -l' >> ~/.bashrc

# COPY docker_run.sh .
# RUN sudo chmod +x /home/node/app/docker_run.sh
# RUN cypress install

CMD ["yarn", "install", "&&", "yarn", "test:prod"]
