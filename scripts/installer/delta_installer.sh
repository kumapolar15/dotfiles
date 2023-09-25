#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist delta)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "alpine" ]; then
    package_install delta
  else
    package_install git-delta
  fi
fi
