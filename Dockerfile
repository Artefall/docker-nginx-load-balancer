FROM alpine:3.8

RUN apk update
RUN apk add nginx

ENV NGINX_PORT=80

ENV PROXY_HOST_1=
ENV PROXY_HOST_2=
ENV PROXY_HOST_3=
ENV PROXY_HOST_4=
ENV PROXY_HOST_5=



EXPOSE ${NGINX_PORT}