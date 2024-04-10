#!/bin/bash

set -eu

ZSH_IN_DOCKER_VERSION=${1}
ZSH_THEME=${2}

# setup oh-my-zsh - https://github.com/deluan/zsh-in-docker
pushd /tmp
curl -L https://github.com/deluan/zsh-in-docker/releases/download/v$ZSH_IN_DOCKER_VERSION/zsh-in-docker.sh -o zsh-in-docker.sh
chmod +x zsh-in-docker.sh
bash zsh-in-docker.sh -x -t $ZSH_THEME -p themes -p git -p nvm
rm zsh-in-docker.sh
popd