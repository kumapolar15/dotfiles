### widgets ###
widget::history() {
    local selected="$(history -inr 1 | fzf --exit-0 --query "$LBUFFER" | cut -d' ' -f4- | sed 's/\\n/\n/g')"
    if [ -n "$selected" ]; then
        BUFFER="$selected"
        CURSOR=$#BUFFER
    fi
    zle -R -c # refresh screen
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
zle -N widget::filepath

bindkey -v
bindkey -M viins "^R"     widget::history     # C-r
bindkey -M viins "^A"     beginning-of-line   # C-a
bindkey -M viins "^E"     end-of-line         # C-e
bindkey -M viins "^P"     widget::filepath    # C-p
bindkey -M vicmd "/"      widget::history     # /
