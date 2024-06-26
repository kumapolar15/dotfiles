#!/bin/bash -xe
# shellcheck source=scripts/installer/installer_utils.sh
source "$(dirname "$0")/installer/installer_utils.sh"

if [ "$(get_os_name)" == "Windows" ] || [ "$(get_os_name)" = "Linux" ] && [ "$(get_linux_distribution)" = "unknown" ]; then
  echo "ERROR: This installer scripts is not supported on this operating system. interrupt installation..."
  exit 0
fi

# install zsh
"$(dirname "$0")/installer/zsh_installer.sh"

# install cargo
# "$(dirname "$0")/installer/cargo_installer.sh"

# install zsh prompt
"$(dirname "$0")/installer/starship_installer.sh"

# install zsh plugin manager
"$(dirname "$0")/installer/sheldon_installer.sh"

# install modern unix command
"$(dirname "$0")/installer/bat_installer.sh"
"$(dirname "$0")/installer/fd_installer.sh"
"$(dirname "$0")/installer/eza_installer.sh"
"$(dirname "$0")/installer/procs_installer.sh"
"$(dirname "$0")/installer/ripgrep_installer.sh"
"$(dirname "$0")/installer/delta_installer.sh"
"$(dirname "$0")/installer/zoxide_installer.sh"
"$(dirname "$0")/installer/httpie_installer.sh"

# install fuzzy finder
"$(dirname "$0")/installer/fzf_installer.sh"

# install runtime manager
# "$(dirname "$0")/installer/rtx_installer.sh"

# install github cli
"$(dirname "$0")/installer/github_cli_installer.sh"

# install ghq
"$(dirname "$0")/installer/ghq_installer.sh"

# install tmux
"$(dirname "$0")/installer/tmux_installer.sh"

# install neovim
"$(dirname "$0")/installer/neovim_installer.sh"
