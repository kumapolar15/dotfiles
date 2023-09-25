zmodload zsh/zprof
# source command override technique
function source {
  regex="$XDG_CONFIG_HOME/"
  if [[ "$1" =~ "$regex" ]]; then
    ensure_zcompiled $1
  fi
  builtin source $1
}
function ensure_zcompiled {
  local compiled="$1.zwc"
  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
    echo "\033[1;36mCompiling\033[m $1"
    zcompile $1
  fi
}
ensure_zcompiled ~/.config/zsh/.zshrc

# sheldon cache technique
export SHELDON_CONFIG_DIR="${SHELDON_CONFIG_DIR:-"$XDG_CONFIG_HOME"/sheldon}"
sheldon_cache="$SHELDON_CONFIG_DIR/sheldon.zsh"
sheldon_toml="$SHELDON_CONFIG_DIR/plugins.toml"
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
unset sheldon_cache sheldon_toml

# starship cache
export STARSHIP_CONFIG_HOME="${STARSHIP_CONFIG_HOME:-"$XDG_CONFIG_HOME"/starship}"
starship_cache="$STARSHIP_CONFIG_HOME/starship.zsh"
starship_toml="$STARSHIP_CONFIG"
if [[ ! -r "$starship_cache" || "$starship_toml" -nt "$starship_cache" ]]; then
  starship init zsh > $starship_cache
fi
source "$starship_cache"
unset starship_cache starship_toml

zprof
