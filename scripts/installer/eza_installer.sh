#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist eza)" = 'Not exist!' ]; then
  package_install eza
fi

if [ "$(package_exist eza)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
fi
