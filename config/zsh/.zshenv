### locale ###
export LANG="ja_JP.UTF-8"

### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZHOMEDIR="$XDG_CONFIG_HOME/zsh"
export ZRCDIR="$ZHOMEDIR/rc"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"

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
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
