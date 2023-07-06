FROM debian:stable

RUN apt update && apt install -y mariadb-server
RUN ls /
RUN mkdir /run/mysqld
CMD ["mariadbd", "--user=root"]
