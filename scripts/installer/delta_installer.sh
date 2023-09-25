#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist delta)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "ubuntu" ]; then
    if [ "$(package_exist wget)" = 'Not exist!' ]; then
      package_install wget
    fi
    if [ "$(package_exist tar)" = 'Not exist!' ]; then
      package_install wget
    fi
    DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
    sudo wget -qO /usr/local/bin/delta.tar.gz "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    sudo tar -zxvf /usr/local/bin/delta.tar.gz
    sudo chmod a+x /usr/local/bin/delta
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "debian" ]; then
    if [ "$(package_exist wget)" = 'Not exist!' ]; then
      package_install wget
    fi
    if [ "$(package_exist tar)" = 'Not exist!' ]; then
      package_install wget
    fi
    DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    sudo wget -qO /usr/local/bin/delta.tar.gz "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    sudo tar -zxvf /usr/local/bin/delta.tar.gz
    sudo chmod a+x /usr/local/bin/delta
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "alpine" ]; then
    package_install delta
  else
    package_install git-delta
  fi
fi
