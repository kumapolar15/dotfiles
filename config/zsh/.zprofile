if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

ARCH=$(uname -m)
if [[ $ARCH == arm64 ]]; then
  echo "Current Architecture: $ARCH"
  eval $(/opt/homebrew/bin/brew shellenv)
elif [[ $ARCH == x86_64 ]]; then
  echo "Current Architecture: $ARCH"
  eval $(/usr/local/bin/brew shellenv)
fi
