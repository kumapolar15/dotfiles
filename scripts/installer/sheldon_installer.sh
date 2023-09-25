#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist sheldon)" = "Not exist!" ]; then
  if [ "$(get_os_name)" = "MacOS" ]; then
    package_install sheldon
  else
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
      | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
  fi
fi

if [ "$(package_exist sheldon)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
else
  sheldon lock
fi
