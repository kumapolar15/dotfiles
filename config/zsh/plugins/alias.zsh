# GNU版のコマンドを優先する
case "$OSTYPE" in
  darwin*)
    (( ${+commands[gdate]} )) && alias date='gdate'
    (( ${+commands[gls]} )) && alias ls='gls'
    (( ${+commands[gdate]} )) && alias mkdir='gmkdir'
    (( ${+commands[gcp]} )) && alias cp='gcp'
    (( ${+commands[gmv]} )) && alias mv='gmv'
    (( ${+commands[grm]} )) && alias rm='grm'
    (( ${+commands[gdu]} )) && alias du='gdu'
    (( ${+commands[ghead]} )) && alias head='ghead'
    (( ${+commands[gtail]} )) && alias tail='gtail'
    (( ${+commands[gsed]} )) && alias sed='gsed'
    (( ${+commands[ggrep]} )) && alias grep='ggrep'
    (( ${+commands[gfind]} )) && alias find='gfind'
    (( ${+commands[gdirname]} )) && alias dirname='gdirname'
    (( ${+commands[gxargs]} )) && alias xargs='gxargs'
  ;;
esac

# RUST代替コマンドを優先する
(( ${+commands[bat]} )) && alias cat='bat'
(( ${+commands[fd]} )) && alias find='fd'
(( ${+commands[ripgrep]} )) && alias grep='rg'
(( ${+commands[eza]} )) && alias ls='eza --color=auto --icons'

# 既定のオプションを追加する
alias du='du -h'
alias tmux='tmux -u'