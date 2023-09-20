dc.build:
	docker compose build --no-cache
dc.up:
	docker compose up -d
dc.down:
	docker compose down
dc.bash:
	docker compose exec ubuntu zsh
setup:
	./scripts/set-link.sh
	./scripts/install.sh
clean:
	./scripts/clean-link.sh
