#!/bin/sh

set -e


cat > /etc/nginx/conf.d/default.conf << EOL

server{

  listen ${NGINX_PORT};

EOL

for n in 1 2 3 4 5
do

if [[ ! -z $(printenv PROXY_PATH_${n}) ]]; then

cat >> /etc/nginx/conf.d/default.conf << EOL

  location /$(printenv PROXY_PATH_${n}) {
    $(printenv PROXY_HOST_${n});
  }

EOL

fi;

done

echo "}" >> /etc/nginx/conf.d/default.conf;

nginx -t

exec "$@"