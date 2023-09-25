#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist fd)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "ubuntu" ]; then
    package_install fd-find
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "debian" ]; then
    package_install fd-find
  else
    package_install fd
  fi
fi

if [ "$(package_exist fd)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
fi
