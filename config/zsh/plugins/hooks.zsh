zshaddhistory(){
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}
chpwd(){
  if [[ $(pwd) != "$HOME" ]]; then
    ls -l
  else
    echo "Welcome home!"
  fi
}