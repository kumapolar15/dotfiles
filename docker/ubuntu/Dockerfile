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
    apt-get install -y zsh make sudo curl

# Install starship
RUN curl -fsSL https://starship.rs/install.sh | bash -s -- -y

RUN mkdir ./dotfiles

CMD ["/bin/zsh"]