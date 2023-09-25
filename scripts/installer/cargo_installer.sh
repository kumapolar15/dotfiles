#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "alpine" ]; then
  package_install alpine-sdk libressl-dev pkgconfig
elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "arch" ]; then
  package_install base-devel openssl pkg-config
elif [ "$(get_os_name)" = "MacOS" ]; then
  package_install openssl pkg-config
else
  package_install build-essential libssl-dev pkg-config
fi

if [ "$(package_exist rustup)" = "Not exist!" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
  source "$CARGO_HOME/env"
fi

if [ ! "$(get_os_name)" = "MacOS" ]; then
  rustup self update
fi

if [ "$(package_exist rustup)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
else
  rustup update
fi
