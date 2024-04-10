#!/bin/bash

set -eu

BASE_PACKAGES="sudo langpacks-en git zsh gzip tar nano findutils hostname nc bind-utils"
JAVA_PACKAGES="java-1.8.0-amazon-corretto java-11-amazon-corretto-headless"
DOTNET_DEPENDENCY_PACKAGES="krb5-libs libicu openssl-libs zlib"
CYPRESS_DEPENDENCY_PACKAGES="xorg-x11-server-Xvfb gtk3-devel nss alsa-lib"
METEOR_DEPENDENCY_PACKAGES="cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel"

# install Amazon Linux 2023 packages - https://docs.aws.amazon.com/linux/al2023/ug/package-management.html
dnf -y install ${BASE_PACKAGES} ${JAVA_PACKAGES} ${DOTNET_DEPENDENCY_PACKAGES} ${CYPRESS_DEPENDENCY_PACKAGES} ${METEOR_DEPENDENCY_PACKAGES}
# install development tools
dnf -y groupinstall "Development Tools" \
# clean up
dnf -y clean all