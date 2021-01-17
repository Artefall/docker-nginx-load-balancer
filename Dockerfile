FROM alpine:3.8

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN mkdir /run/nginx
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel

ENV NGINX_PORT=80

ENV PROXY_HOST_1=
ENV PROXY_PATH_1=

ENV PROXY_HOST_2=
ENV PROXY_PATH_2=

ENV PROXY_HOST_3=
ENV PROXY_PATH_3=

ENV PROXY_HOST_4=
ENV PROXY_PATH_4=

ENV PROXY_HOST_5=
ENV PROXY_PATH_5=



COPY ./docker-create-proxy-script.sh /usr/local/bin/docker-create-proxy-script.sh
RUN chmod +x /usr/local/bin/docker-create-proxy-script.sh

EXPOSE ${NGINX_PORT}

ENTRYPOINT [ "docker-create-proxy-script.sh" ]
CMD ["nginx", "-g", "daemon off;"]
