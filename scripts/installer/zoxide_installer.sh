#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist zoxide)" = "Not exist!" ]; then
  package_install zoxide
fi

if [ "$(package_exist zoxide)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
fi
