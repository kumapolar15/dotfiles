FROM alpine:latest

RUN apk update && \
    apk add zsh git sudo curl file make bash --no-cache

ARG USERNAME=user
ARG UID=1000
RUN adduser -D -u "${UID}" -s /bin/zsh -G wheel "${USERNAME}"
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME="/home/$USERNAME"
RUN mkdir -p "${HOME}"
WORKDIR "${HOME}"

USER "${USERNAME}"

RUN mkdir ./dotfiles

CMD ["/bin/zsh"]
