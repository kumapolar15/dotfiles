## ローカルの.zprofileが存在する場合は読み込む
if [[ -f "$HOME/.zprofile.local" ]]; then
  source "$HOME/.zprofile.local"
fi
if [[ -f "$XDG_CONFIG_HOME/zsh/.zprofile.local" ]]; then
  source "$XDG_CONFIG_HOME/zsh/.zprofile.local"
fi