#!/bin/bash

set -eu

NVM_VERSION=${1}

# setup nvm - https://github.com/nvm-sh/nvm
pushd /tmp
curl -L https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh -o nvm-install.sh
chmod +x nvm-install.sh
bash nvm-install.sh
rm nvm-install.sh
popd
