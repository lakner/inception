.PHONY: kill build down

include .env
export DOCKER_PROJECT = ${PROJECT_NAME}

all: docker compose up -d

kill:
	docker compose kill

build:
	docker compose up -d --build

down:
	docker compose down

re:
	docker system prune && docker volume prune && docker build --no-cache && docker-compose up -d
