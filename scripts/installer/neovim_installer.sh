#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist nvim)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "alpine" ]; then
    package_install neovim neovim-doc
  else
    package_install neovim
  fi
fi

if [ "$(package_exist nvim)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
fi
