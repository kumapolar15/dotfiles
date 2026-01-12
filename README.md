# dotfiles

## 検証環境

下記コマンドで`~/dofiles`にマウントされた検証環境(ubuntu)を構築できる

```sh
# build & start
docker compose up -d ubuntu
# attach
docker compose exec ubuntu /bin/zsh
```