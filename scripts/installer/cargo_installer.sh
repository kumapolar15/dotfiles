#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(get_os_name)" == "Linux" ] && [ "$(get_linux_distribution)" == "alpine" ]; then
  args=("curl" "alpine-sdk" "libressl-dev" "pkgconfig")
elif [ "$(get_os_name)" == "Linux" ] && [ "$(get_linux_distribution)" == "arch" ]; then
  args=("curl" "base-devel" "openssl" "pkg-config")
else
  args=("curl" "build-essential" "libssl-dev" "pkg-config")
fi
package_install "${args[@]}"

if [ "$(package_exist rustup)" = "Not exist!" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
  source "$CARGO_HOME/env"
fi

rustup self update
rustup update
