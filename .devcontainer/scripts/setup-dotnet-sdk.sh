#!/bin/bash

set -eu

DOTNET_SDK_VERSION=${1}
DOTNET_INSTALL_DIR=${2}

# install dotnet sdk - https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
pushd /tmp
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh
bash dotnet-install.sh --version $DOTNET_SDK_VERSION --install-dir $DOTNET_INSTALL_DIR
printf '\nexport DOTNET_ROOT=/usr/share/dotnet\nexport DOTNET_CLI_TELEMETRY_OUTPUT=1\nexport PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools\n' > /etc/profile.d/dotnet.sh
chmod +x /etc/profile.d/dotnet.sh
. /etc/profile.d/dotnet.sh
dotnet workload update
rm dotnet-install.sh
popd