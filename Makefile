.PHONY: dev setup

dev:
	@docker-compose down && \
		docker-compose build --pull --no-cache && \
		docker-compose run api mix deps.get && \
		docker-compose run api mix ecto.create && \
		docker-compose run api mix ecto.migrate && \
		docker-compose up -d && \
		echo "You can visit localhost:8080 from your browser"

setup:
	@docker-compose build --pull --no-cache && \
		docker-compose run api mix deps.get && \
		docker-compose run api mix ecto.setup && \
		docker-compose up -d && \
		echo "You can visit localhost:8080 from your browser"
