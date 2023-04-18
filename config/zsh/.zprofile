if [ -e "$HOME/.zprofile.local" ] ; then
  source "$HOME/.zprofile.local"
fi

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi
