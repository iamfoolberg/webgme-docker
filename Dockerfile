FROM node:16.17.0
#use this node version.
MAINTAINER berg <iamfoolberg@163.com>
#i use debian mirror to accelerate the updating and installing
ADD ./sources.list /etc/apt/sources.list
ADD ./entrypoint.sh /entrypoint.sh

RUN rm /bin/sh && ln -s /bin/bash /bin/sh \
    && mkdir -p /opt/webgme/app \
    && mkdir -p /opt/webgme/system/node_global \
    && mkdir -p /opt/webgme/system/node_cache \
    && mkdir -p /opt/webgme/system \
    && apt-get update \
    && apt-get install -y git curl\
    && chmod a+x /entrypoint.sh
RUN npm config set prefix "/opt/webgme/system/node_global" \
    && npm config set cache "/opt/webgme/system/node_cache" \
    && cd /opt/webgme/app
#I have to exec the following commands one by one, for my poor network...
RUN npm install -g webgme-cli --verbose
RUN npm install -g bower --verbose
#I simply use the webgme/ui-components repo, for my poor network again. 
RUN cd /opt/webgme/app \
    && git clone https://github.com/webgme/ui-components.git \
    && cd /opt/webgme/app/ui-components
WORKDIR /opt/webgme/app/ui-components
RUN npm install --verbose

ADD ./config.docker.js /opt/webgme/app/ui-components/config/config.docker.js

ENV NODE_ENV docker

EXPOSE 8888

VOLUME ["/opt/webgme"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sleep", "infinity"]