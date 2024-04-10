#!/bin/bash

set -eu

NODE_VERSION=${1}

# setup node using nvm
. ~/.nvm/nvm.sh install node $NODE_VERSION