#!/bin/bash

get_os_bit() {
  uname -m;
}

get_os_name() {
  if [ "$(uname)" == 'Darwin' ]; then
    echo 'MacOS'
  elif [ "$(uname)" == 'Linux' ]; then
    echo 'Linux'
  else
    echo 'Windows'
  fi
}

is_wsl() {
  if [ "$(uname)" == 'Linux' ] && [ -e /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    echo 'true'
  else
    echo 'false'
  fi
}

get_linux_distribution() {
  if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
    if [ -e /etc/lsb-release ]; then
      distri_name="ubuntu"
    else
      distri_name="debian"
    fi
  elif [ -e /etc/redhat-release ]; then
    if [ -e /etc/oracle-release ]; then
      distri_name="oracle"
    else
      distri_name="redhat"
    fi
  elif [ -e /etc/arch-release ]; then
    distri_name="arch"
  elif [ -e /etc/alpine-release ]; then
    distri_name="alpine"
  else
    distri_name="unknown"
  fi

  echo ${distri_name}
}

package_install() {
  os_name=$(get_os_name)
  args=("$@")
  if [ "$os_name" = "MacOS" ]; then
    brew update
    brew install "${args[*]}"
  fi
  if [ "$os_name" = "Linux" ]; then
    linux_distribution=$(get_linux_distribution)
    if [ "$linux_distribution" = "ubuntu" ] || [ "$linux_distribution" = "debian" ]; then
      sudo apt-get update
      sudo apt-get install -y "${args[*]}"
    elif [ "$linux_distribution" = "oracle" ] || [ "$linux_distribution" = "redhat" ]; then
      sudo yum update
      sudo yum install -y "${args[*]}"
    elif [ "$linux_distribution" = "arch" ]; then
      sudo pacman -Syu --noconfirm
      sudo pacman -S --noconfirm "${args[*]}"
    elif [ "$linux_distribution" = "alpine" ]; then
      sudo apk add "${args[*]}"
    fi
  fi
}
