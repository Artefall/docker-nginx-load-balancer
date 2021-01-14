FROM alpine:3.8

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN mkdir /run/nginx
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel

ARG NGINX_PORT
ENV PROXY_HOST_1=
ENV PROXY_HOST_2=
ENV PROXY_HOST_3=
ENV PROXY_HOST_4=
ENV PROXY_HOST_5=

COPY ./nginx-create-proxy.sh ./script.sh
RUN chmod +x ./script.sh

EXPOSE ${NGINX_PORT}

STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]
