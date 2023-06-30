FROM debian:stable

RUN apt update && apt install -y nginx
EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

