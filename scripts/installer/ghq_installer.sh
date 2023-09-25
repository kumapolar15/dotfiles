#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/../common.sh"
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

if [ "$(package_exist ghq)" = 'Not exist!' ]; then
  if [ "$(get_os_name)" = "Linux" ] && [ "ubuntu debian" =~ "$(get_linux_distribution)" ]; then
    echo "Sorry, but ghq_installer is not work on debian linux. please install ghq yourself."
    exit 0
  elif [ "$(get_os_name)" = "Linux" ] && [ "oracle redhat" =~ "$(get_linux_distribution)" ]; then
    echo "Sorry, but ghq_installer is not work on redhat linux. please install ghq yourself."
    exit 0
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "alpine" ]; then
    echo "Sorry, but ghq_installer is not work on alpine linux. please install ghq yourself."
    exit 0
  elif [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "arch" ]; then
    echo "Sorry, but ghq_installer is not work on arch linux. please install ghq yourself."
    exit 0
  else
    package_install ghq
  fi
fi
