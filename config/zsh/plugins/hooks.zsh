zshaddhistory(){
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}

__chpwd_ll(){
  local -r display_rows="$1"
  if (( $+commands[eza] )); then
    eza -l --icons=always --color=always | head -n "$display_rows"
  else
    ls -l | head -n "$display_rows"
  fi
}
chpwd(){
  local -r LIMIT_DISABLE_SORT_COUNT=1000
  local -r DISPLAY_ROWS=20

  if [[ $(pwd) = "$HOME" ]]; then
    echo "Welcome home!"
  else
    line_count=$(\find . | head -n $((LIMIT_DISABLE_SORT_COUNT + 1)) | wc -l)

    if [[ "$line_count" -le "$DISPLAY_ROWS" ]];then
      __chpwd_ll $DISPLAY_ROWS
    elif [[ "$line_count" -le "$LIMIT_DISABLE_SORT_COUNT" ]];then
      local -r remaining=$((line_count - DISPLAY_ROWS))
      __chpwd_ll $DISPLAY_ROWS
      echo "\n... and $remaining more items (total $line_count)"
    else
      echo -e "[\e[33mWARN\e[0m]: Over $LIMIT_DISABLE_SORT_COUNT files/directories detected! 'chpwd' has been disabled."
    fi
  fi
}
