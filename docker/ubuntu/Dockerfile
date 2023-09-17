FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y zsh

ARG USERNAME=USERNAME
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/zsh -u $UID -g $GID $USERNAME
USER $USERNAME

ENV HOME="/home/$USERNAME"
WORKDIR $HOME

COPY ./config ./.config
# ToDo: 下記の処理をインストール時に実行
RUN ln -sfv "$HOME/.config/zsh/.zshenv" "$HOME/.zshenv"

CMD ["/bin/zsh"]
