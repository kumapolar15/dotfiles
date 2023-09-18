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
COPY ./config ./dotfiles/config
COPY ./scripts ./dotfiles/scripts
COPY ./Makefile ./dotfiles/Makefile
RUN chmod -R +x ./dotfiles/scripts

USER $USERNAME
RUN cd ./dotfiles && make setup

CMD ["/bin/zsh"]
