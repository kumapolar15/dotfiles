#!/bin/bash -xe
source "$(dirname "$0")/installer_utils.sh"

args=(zsh)
package_install "${args[@]}"
