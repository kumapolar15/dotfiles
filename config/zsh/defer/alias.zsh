case "$OSTYPE" in
  darwin*)
    (( ${+commands[gdate]})) && alias date='gdate'
    (( ${+commands[gls]})) && alias ls='gls'
    (( ${+commands[gdate]})) && alias mkdir='gmkdir'
    (( ${+commands[gcp]})) && alias cp='gcp'
    (( ${+commands[gmv]})) && alias mv='gmv'
    (( ${+commands[grm]})) && alias rm='grm'
    (( ${+commands[gdu]})) && alias du='gdu'
    (( ${+commands[ghead]})) && alias head='ghead'
    (( ${+commands[gtail]})) && alias tail='gtail'
    (( ${+commands[gsed]})) && alias sed='gsed'
    (( ${+commands[ggrep]})) && alias grep='ggrep'
    (( ${+commands[gfind]})) && alias find='gfind'
    (( ${+commands[gdirname]})) && alias dirname='gdirname'
    (( ${+commands[gxargs]})) && alias xargs='gxargs'
  ;;
esac

alias du='du -h'
alias tmux='tmux -u'
alias find='fd'
alias cat='bat'
alias ps='procs'
alias ls='exa --color=auto --icons'
alias ll='exa -l --color=auto --icons'
alias la='exa -la --color=auto --icons'
