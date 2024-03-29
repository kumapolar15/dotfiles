dc.build:
	docker compose build --no-cache alpine
dc.up:
	docker compose up -d alpine
dc.down:
	docker compose down alpine
dc.bash:
	docker compose exec alpine zsh
setup:
	./scripts/set-link.sh
	./scripts/install.sh
clean:
	./scripts/clean-link.sh
