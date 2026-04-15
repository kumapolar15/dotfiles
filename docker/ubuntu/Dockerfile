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
    apt-get install -y zsh make sudo curl git tmux fzf golang fd-find bat eza ripgrep
ENV TERM xterm-256color

# Install neovim latest version
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz \
  && rm -rf /opt/nvim \
  && mkdir -p /opt/nvim \
  && tar -C /opt/nvim --strip-components=1 -xzf nvim-linux-arm64.tar.gz \
  && rm nvim-linux-arm64.tar.gz
ENV PATH="/opt/nvim/bin:${PATH}"

# Install starship
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

# Install sheldon
RUN curl --proto '=https' -fsSL https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- -y --repo rossmacarthur/sheldon --to /usr/local/bin

# Install ghq
RUN GOBIN=/usr/local/bin go install github.com/x-motemen/ghq@latest

RUN mkdir ./dotfiles

# Change "ubuntu" login shell
RUN chsh -s /bin/zsh ubuntu

CMD ["/bin/zsh"]
