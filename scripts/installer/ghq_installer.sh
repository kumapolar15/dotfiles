#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist ghq)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ]; then
    if [ "$(get_os_bit)" = "x86_64" ]; then
      if [ "$(package_exist unzip)" = "Not exist!" ]; then
        package_install unzip
      fi
      GHQ_VERSION=$(curl -s "https://api.github.com/repos/x-motemen/ghq/releases/latest" | grep -o '"tag_name": "v[0-9.]\+"' | cut -f 4 -d '"')
      sudo wget -qO /tmp/ghq.zip "https://github.com/x-motemen/ghq/releases/download/${GHQ_VERSION}/ghq_linux_amd64.zip"
      sudo unzip -q /tmp/ghq.zip -d /tmp/ghq
      sudo mv /tmp/ghq/ghq_linux_amd64/ghq /usr/local/bin
      sudo chmod a+x /usr/local/bin/ghq
    fi
  elif [ "$(get_os_name)" = "MacOS"]; then
    package_install ghq
  fi
fi

if [ "$(package_exist ghq)" = 'Not exist!' ]; then
  echo "Failed to install."
  exit 1
fi
