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
clean:
	./scripts/clean-link.sh
install-alacritty-themes:
	./scripts/install-alacritty-themes.sh
