FROM ubuntu:latest

# Shift timezone to Asia/Tokyo.
RUN apt-get update && apt-get install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV TZ Asia/Tokyo

# Set local to jp.
RUN apt-get update && apt-get install -y language-pack-ja && \
    update-locale LANG=ja_JP.UTF-8 && rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Install zsh, make, etc.
RUN apt-get update && \
    apt-get install -y zsh make sudo curl git tmux fzf golang fd-find bat eza ripgrep unzip wget
ENV TERM xterm-256color

# Install neovim latest version
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz \
  && rm -rf /opt/nvim \
  && mkdir -p /opt/nvim \
  && tar -C /opt/nvim --strip-components=1 -xzf nvim-linux-arm64.tar.gz \
  && rm nvim-linux-arm64.tar.gz
ENV PATH="/opt/nvim/bin:${PATH}"

# Install starship
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y \
  && hash -r \
  && /usr/local/bin/starship --version

# Install sheldon
RUN curl --proto '=https' -fsSL https://rossmacarthur.github.io/install/crate.sh \
  | bash -s -- -y --repo rossmacarthur/sheldon --to /usr/local/bin \
  && hash -r \
  && /usr/local/bin/sheldon --version

# Install ghq
RUN GOBIN=/usr/local/bin go install github.com/x-motemen/ghq@latest \
  && hash -r \
  && /usr/local/bin/ghq --version

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') \
  && LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz" \
  && tar xf lazygit.tar.gz lazygit \
  && install lazygit -D -t /usr/local/bin \
  && rm lazygit.tar.gz lazygit \
  && hash -r \
  && /usr/local/bin/lazygit --version

RUN mkdir ./dotfiles

# Change "ubuntu" login shell
RUN chsh -s /bin/zsh ubuntu

CMD ["/bin/zsh"]
