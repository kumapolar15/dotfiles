build:
	docker compose build --no-cache
up:
	docker compose up -d
down:
	docker compose down
bash:
	docker compose exec ubuntu zsh
setup:
	./scripts/install.sh
	./scripts/set-link.sh
