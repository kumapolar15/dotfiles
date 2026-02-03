eval "$(starship init zsh)"
_starship_cache="${XDG_CACHE_HOME}/starship/starship.zsh"
if [[ ! -d "${_starship_cache:h}" ]]; then
  mkdir -p "${_starship_cache:h}"
fi
if [[ ! -r "$_starship_cache" || "$STARSHIP_CONFIG" -nt "$_starship_cache" ]]; then
  starship init zsh > "$_starship_cache"
fi
source "$_starship_cache"