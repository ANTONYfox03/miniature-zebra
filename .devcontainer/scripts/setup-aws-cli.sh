#!/bin/bash

set -eu

# "uname -m" returns x86_64 for amd64 or aarch64 for arm64
PLATFORM_ARCH=$(uname -m)

# install awscli v2 for current platform architecture - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
pushd /tmp
curl -L https://awscli.amazonaws.com/awscli-exe-linux-${PLATFORM_ARCH}.zip -o awscliv2.zip
unzip -q awscliv2.zip
bash ./aws/install
rm awscliv2.zip
rm -r aws/
popd