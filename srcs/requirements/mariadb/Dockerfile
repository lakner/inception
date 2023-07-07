FROM debian:stable

RUN apt update && apt install -y mariadb-server
RUN ls /
RUN mkdir /run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/db_setup.sh /usr/local/bin/db_setup.sh
RUN chmod +x /usr/local/bin/db_setup.sh 
#&& ./db_setup.sh

#CMD ["tail", "-f"]
#CMD ["mysqld",  "--user=root"]
CMD ["/usr/local/bin/db_setup.sh"]