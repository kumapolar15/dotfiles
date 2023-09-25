#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist procs)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "ubuntu" ]; then
    PROCS_VERSION=$(curl -s "https://api.github.com/repos/dalance/procs/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    sudo wget -qO /usr/local/bin/procs.gz "https://github.com/dalance/procs/releases/latest/download/procs-v${PROCS_VERSION}-x86_64-lnx.zip"
    sudo gunzip /usr/local/bin/procs.gz
    sudo chmod a+x /usr/local/bin/procs
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "debian" ]; then
    PROCS_VERSION=$(curl -s "https://api.github.com/repos/dalance/procs/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    sudo wget -qO /usr/local/bin/procs.gz "https://github.com/dalance/procs/releases/latest/download/procs-v${PROCS_VERSION}-x86_64-lnx.zip"
    sudo gunzip /usr/local/bin/procs.gz
    sudo chmod a+x /usr/local/bin/procs
  else
    package_install procs
  fi
fi
