dc.build:
	docker compose build --no-cache
dc.up:
	docker compose up -d
dc.down:
	docker compose down
dc.bash:
	docker compose exec ubuntu zsh
setup:
	./scripts/install.sh
	./scripts/set-link.sh
clean:
	./scripts/clean-link.sh
