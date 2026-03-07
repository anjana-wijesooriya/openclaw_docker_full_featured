FROM ghcr.io/openclaw/openclaw:latest

USER root
COPY ./scripts/root.sh /tmp/root.sh
RUN bash /tmp/root.sh

USER node
COPY --chown=node:node ./scripts/node.sh /tmp/node.sh
RUN bash /tmp/node.sh

# Install script for skill dependencies (run once after first start)
COPY --chown=node:node ./scripts/install-skills /usr/local/bin/install-skills
RUN chmod +x /usr/local/bin/install-skills

# Make package managers available to every process
# All skill installs go to /home/node (persisted via volume mount)
ENV GOPATH="/home/node/go"
ENV NPM_CONFIG_PREFIX="/home/node/.npm-global"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/usr/local/go/bin:/home/node/go/bin:/home/node/.local/bin:/home/node/.npm-global/bin:${PATH}"

