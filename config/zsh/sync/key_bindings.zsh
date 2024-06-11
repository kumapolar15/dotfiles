### widgets ###
widget::history() {
  local selected="$(history -inr 1 | fzf --exit-0 --query "$LBUFFER" | cut -d' ' -f4- | sed 's/\\n/\n/g')"
  if [ -n "$selected" ]; then
    BUFFER="$selected"
    CURSOR=$#BUFFER
  fi
  zle -R -c # refresh screen
}

widget::ghq::source() {
  local session color icon green="\e[32m" blue="\e[34m" reset="\e[m" checked="\Uf0132" unchecked="\Uf0131"
  local sessions=($(tmux list-sessions -F "#S" 2>/dev/null))

  ghq list | sort | while read -r repo; do
    session="${repo//[:. ]/-}"
    color="$blue"
    icon="$unchecked"
    if (( ${+sessions[(r)$session]} )); then
      color="$green"
      icon="$checked"
    fi
    printf "$color$icon %s$reset\n" "$repo"
  done
}

widget::ghq::select() {
  local root="$(ghq root)"
  widget::ghq::source | fzf --exit-0 --preview="exa -lh ${(q)root}/{2}/{3}/{4} --color=always --icons" --preview-window="right:60%" | cut -d' ' -f2-
}

widget::ghq::dir() {
  local selected="$(widget::ghq::select)"
  if [ -z "$selected" ]; then
    return
  fi

  local repo_dir="$(ghq list --exact --full-path "$selected")"
  BUFFER="cd ${(q)repo_dir}"
  zle accept-line
  zle -R -c
}

widget::ghq::session() {
  local selected="$(widget::ghq::select)"
  if [ -z "$selected" ]; then
    return
  fi

  local repo_dir="$(ghq list --exact --full-path "$selected")"
  local session_name="${selected//[:. ]/-}"

  if [ -z "$TMUX" ]; then
    BUFFER="tmux new-session -A -s ${(q)session_name} -c ${(q)repo_dir}"
    zle accept-line
  elif [ "$(tmux display-message -p "#S")" = "$session_name" ] && [ "$PWD" != "$repo_dir" ]; then
    BUFFER="cd ${(q)repo)_dir}"
    zle accept-line
  else
    tmux new-session -d -s "$session_name" -c "$repo_dir" 2>/dev/null
    tmux switch-client -t "$session_name"
  fi
  zle -R -c
}

function tree_select() {
  tree -N -a --charset=o -f -I '.git|.idea|resolution-cache|target/streams|node_modules|vendor' | \
    fzf --preview 'f() {
      set -- $(echo -- "$@" | grep -o "\./.*$");
      if [ -d $1 ]; then
        ls -lh $1
      else
        head -n 100 $1
      fi
    }; f {}' | \
      sed -e "s/ ->.*\$//g" | \
      tr -d '\||`| ' | \
      tr '\n' ' ' | \
      sed -e "s/--//g" | \
      xargs echo
}

function dir_select() {
  fd --follow --hidden --exclude .git --color=always . | \
  fzf --preview 'f() {
    if [ -d $1 ]; then
      ls -lh $1
    else
      head -n 100 $1 | bat --color=always
    fi
  }; f {}' | xargs echo
}

function widget::filepath(){
  local SELECTED_FILE="$(dir_select)"
  if [ -n "$SELECTED_FILE" ]; then
    LBUFFER+="$SELECTED_FILE"
    CURSOR=$#LBUFFER
    zle reset-prompt
  fi
}

zle -N widget::history
zle -N widget::ghq::dir
zle -N widget::ghq::session
zle -N widget::filepath

bindkey -v
bindkey "^R"              widget::history       # C-r
bindkey "^G"              widget::ghq::session  # C-g
bindkey "^[g"             widget::ghq::dir      # Alt-g
bindkey -M viins "^A"     beginning-of-line     # C-a
bindkey -M viins "^E"     end-of-line           # C-e
bindkey -M viins "^P"     widget::filepath      # C-p
bindkey -M vicmd "/"      widget::history       # /
