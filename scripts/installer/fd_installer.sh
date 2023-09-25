#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist fd)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "ubuntu debian" =~ "$(get_linux_distribution)" ]; then
    package_install fd-find
  else
    package_install fd
  fi
fi
