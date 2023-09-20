FROM ubuntu:latest

RUN apt update && \
    apt install -y zsh make sudo

ARG USERNAME=user
ARG UID=1000
RUN useradd -u $UID -m -s /bin/zsh -G sudo,root $USERNAME
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME="/home/$USERNAME"
WORKDIR $HOME

RUN mkdir ./dotfiles

USER $USERNAME

CMD ["/bin/zsh"]
