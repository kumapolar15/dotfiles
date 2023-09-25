#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist gh)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "ubuntu debian" =~ "$(get_linux_distribution)" ]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/nul
    package_install gh
  elif [ "$(get_os_name)" = "Linux" ] && [ "oracle redhat" =~ "$(get_linux_distribution)" ]; then
    package_install gh
  else
    package_install github-cli
  fi
fi
