### locale ###
export LANG="ja_JP.UTF-8"

### XDG ###
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
skip_global_compinit=1

### Starship ###
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

### SHELDON ###
export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/sheldon"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon"
export SHELDON_CONFIG_FILE="$SHELDON_CONFIG_DIR/plugins.toml"

### FZF ###
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--exit-0 --ansi"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#c6c8d1,bg:#121212,bg+:#1e2132
  --color=hl:#84a0c6,hl+:#89b8c2,info:#b4b282,marker:#89b8c2
  --color=prompt:#b4be82,spinner:#a093c7,pointer:#d2d4de,header:#a093c7
  --color=border:#0f1117,label:#aeaeae,query:#c6c8d1
  --border="block" --border-label="" --preview-window="border-block" --prompt="❯ "
  --marker=">" --pointer=">" --separator="─" --scrollbar="|"
  --layout="reverse"'

### Bat ###
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$BAT_CONFIG_DIR/bat.conf"
export BAT_PAGER="less -RFK"

### PATH ###
path=(
  "$HOME/.local/bin"
  "${path[@]}"
)
fpath=(
  "$XDG_DATA_HOME/zsh/site-functions"(N-/)
  "${fpath[@]}"
)

## ローカルの.zshenvが存在する場合は読み込む
if [[ -f "$HOME/.zshenv.local" ]]; then
  source "$HOME/.zshenv.local"
fi
if [[ -f "$XDG_CONFIG_HOME/zsh/.zshenv.local" ]]; then
  source "$XDG_CONFIG_HOME/zsh/.zshenv.local"
fi
