#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist bat)" = 'Not exist!' ]; then
  package_install bat
fi

if [ "$(package_exist bat)" = 'Not exist!' ]; then
  if [ "$(package_exist batcat)" = 'Not exist!' ]; then
    echo "Failed to install."
    exit 1
  else
    ln -s /usr/bin/batcat "$HOME/.local/bin/bat"
  fi
fi
