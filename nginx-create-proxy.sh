#/bin/sh

mkdir /etc/nginx/sites-enabled
touch /etc/nginx/sites-enabled/proxy.conf

cat > /etc/nginx/sites-enabled/proxy.conf << EOL

upstream backend {
    least_conn;

    ${PROXY_HOST_1}
    ${PROXY_HOST_2}
    ${PROXY_HOST_3}
    ${PROXY_HOST_4}
    ${PROXY_HOST_5}
  
}

server{
  listen ${NGINX_PORT};
  location / {
    proxy_pass http://backend;
  }
}

EOL