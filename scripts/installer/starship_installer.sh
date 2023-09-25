#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist starship)" = "Not exist!" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
fi
