.PHONY: kill build down

include ./srcs/.env

all: 
	mkdir -p /home/slakner/data
	mkdir -p /home/slakner/data/wordpress
	mkdir -p /home/slakner/data/mariadb
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

re: fclean all
