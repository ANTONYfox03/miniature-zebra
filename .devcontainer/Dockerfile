FROM amazonlinux:2023

# args
ARG TERM=xterm
ARG USERNAME=alloy
ARG USER_UID=1000
ARG USER_GID=1000
ARG DOTNET_SDK_VERSION=8.0.203
ARG DOTNET_INSTALL_DIR=/usr/share/dotnet
ARG NVM_VERSION=0.39.7
ARG NODE_VERSION=lts/iron
ARG ZSH_IN_DOCKER_VERSION=1.1.5
ARG ZSH_THEME=fwalch

# Copy scripts into container
RUN mkdir -p /tmp/scripts
COPY scripts/*.sh /tmp/scripts/

# run setup scripts that install as root
RUN bash /tmp/scripts/setup-packages.sh
RUN bash /tmp/scripts/setup-dotnet-sdk.sh "${DOTNET_SDK_VERSION}" "${DOTNET_INSTALL_DIR}"
RUN bash /tmp/scripts/setup-aws-cli.sh
RUN bash /tmp/scripts/setup-user.sh "${USERNAME}" "${USER_UID}" "${USER_GID}"

# set user to the non-root user
USER $USERNAME

# run setup scripts that install as non-root user
RUN bash /tmp/scripts/setup-nvm.sh "${NVM_VERSION}"
RUN bash /tmp/scripts/setup-node.sh "${NODE_VERSION}"
RUN bash /tmp/scripts/setup-oh-my-zsh.sh "${ZSH_IN_DOCKER_VERSION}" "${ZSH_THEME}"
RUN bash /tmp/scripts/setup-user-npmrc.sh
