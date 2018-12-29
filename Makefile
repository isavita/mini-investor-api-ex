.PHONY: dev setup

dev:
	@docker-compose down && \
		docker-compose build --pull --no-cache && \
		docker-compose up -d

setup:
	@docker-compose build --pull --no-cache && \
		docker-compose run api mix ecto.setup && \
		docker-compose up -d
