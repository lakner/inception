.PHONY: kill build down

include ./srcs/.env
export DOCKER_PROJECT = ${PROJECT_NAME}

all: 
	docker-compose -f ./srcs/docker-compose.yml up -d

kill:
	docker-compose -f ./srcs/docker-compose.yml kill

build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune

fclean: clean
	docker volume prune

re: fclean
	docker-compose -f ./srcs/docker-compose.yml build --no-cache
	docker-compose -f ./srcs/docker-compose.yml up -d
