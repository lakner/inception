FROM debian:stable

RUN apt update \
	&& apt install -y nginx openssl \
	&& rm -rf /var/lib/apt/lists/*

ARG DAYS_VALID=42
ARG DOMAIN_NAME=slakner.42.fr

RUN echo "Creating self-signed certificate valid for ${DAYS_VALID} days for domain ${DOMAIN_NAME}" && \
    openssl req -x509 -nodes -subj "/CN=${DOMAIN_NAME}}" -addext "subjectAltName=DNS:${DOMAIN_NAME}" \
    -days ${DAYS_VALID} -newkey rsa:4096 -keyout /etc/ssl/private/${DOMAIN_NAME}.key -out /etc/ssl/certs/${DOMAIN_NAME}.crt

COPY conf/slakner.42.fr.conf /etc/nginx/sites-available/default

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

