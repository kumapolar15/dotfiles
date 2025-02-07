### locale ###
export LANG="ja_JP.UTF-8"

### XDG ###
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZHOMEDIR="$XDG_CONFIG_HOME/zsh"
export ZRCDIR="$ZHOMEDIR/rc"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"

setopt no_global_rcs

### Rust ###
export RUST_BACKTRACE=1
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

### Starship ###
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

### bat ###
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"

### PATH ###
path=(
  "/usr/local/bin"(N-/)
  "$HOME/bin"(N-/)
  "$HOME/.local/bin"(N-/)
  "$CARGO_HOME/bin"(N-/)
  "${path[@]}"
)
export PATH
fpath=(
  "$ZDOTDIR/completions"(N-/)
  "$ZDOTDIR/completions.local"(N-/)
  "${fpath[@]}"
)
export FPATH

if [ -e "$HOME/.zshenv.local" ]; then
    source ~/.zshenv.local
fi
