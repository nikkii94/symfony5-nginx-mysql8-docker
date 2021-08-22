app_container_name=php74-container

start:
	@docker-compose up -d

stop:
	@docker-compose stop

down:
	@docker-compose down

build:
	@docker-compose build

ssh:
	@docker exec -it $(app_container_name) bash

exec:
	@docker exec -it $(app_container_name) $$cmd

config:
	@docker-compose -f docker-compose.yml config

composer-install:
	@make exec cmd="composer install"

yarn-install:
	@make exec cmd="yarn install"