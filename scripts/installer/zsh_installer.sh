#!/bin/bash -xe
# shellcheck source=installer_utils.sh
source "$(dirname "$0")/installer_utils.sh"

args=(zsh)
package_install "${args[@]}"
