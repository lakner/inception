.PHONY: kill build down

include ./srcs/.env
export DOCKER_PROJECT = ${PROJECT_NAME}

all: 
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

kill:
	sudo docker-compose -f ./srcs/docker-compose.yml kill

build:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean: down
	sudo docker system prune -f --all

fclean: clean
	sudo docker image rm srcs_nginx || true
	sudo docker image rm srcs_wordpress || true
	sudo docker image rm srcs_mariadb || true
	sudo docker volume prune -f --filter "label=src_*"

re: fclean
	sudo docker-compose -f ./srcs/docker-compose.yml build --no-cache
	sudo docker-compose -f ./srcs/docker-compose.yml up -d
