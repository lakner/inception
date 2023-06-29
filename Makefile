.PHONY: kill build down

include .env
export DOCKER_PROJECT = ${PROJECT_NAME}

all: build

kill:
	docker compose kill

build:
	docker compose up -d --build

down:
	docker compose down
